class StudentsController < ApplicationController

  def index
    @students = Student.pluck(:name)
    render json: @students
  end

  def show
    @student = Student.find_by_id(params[:id])
    render json: @student
  end

  def create
    puts params
    @student = Student.new(student_params)
    if @student.save
      render json: "saved."
    else
      render json: "Some error occur in saving record"
    end
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    render json: "updated"
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    render json: "deleted"
  end

  private
  def student_params
    params.require(:student).permit(:name, :age)
  end
end
