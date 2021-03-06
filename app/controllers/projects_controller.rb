class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end
  
  def create
    @project  = Project.new(params[:project])
    if @project.save
      flash[:message] = "Project successfully registered"
      redirect_to user_path(@project.user.login)
    else
      render :new
    end
  end

  def show
    @project = Project.find_by_identifier params[:identifier]
    
    @total_metrics = @project.total_metrics if @project != nil
    @statistical_metrics = @project.statistical_metrics if @project != nil
    
    @svn_error = @project.svn_error if (@project != nil && @project.svn_error)
  end

  def index
    @projects = Project.find :all
  end

  def status
    @project = Project.find_by_identifier params[:identifier]
    render :layout => false
  end
end
