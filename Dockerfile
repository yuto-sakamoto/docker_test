# Base Image
FROM jupyter/base-notebook

# Maintainer
LABEL maintainer "Yuto Sakamoto"

# Configure environment
ENV CONDA_DIR=/opt/conda \
    NB_USER=sakamoto
    
# Install Jupyter Notebook and Hub
RUN conda install --quiet --yes \
    'numpy=1.13.*' \
    'scipy=0.19.*' \
    'sympy=1.1.*' \
    'matplotlib=2.1.*' \
    && conda clean -tipsy && \
    fix-permissions $CONDA_DIR

# Install Sample Notebook
COPY app/ /home/$NB_USER/
