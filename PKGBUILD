# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - The teb_local_planner package implements a plugin to the base_local_planner of the 2D navigation stack."
    url='http://wiki.ros.org/teb_local_planner'

    pkgname='ros-melodic-teb-local-planner'
    pkgver='0.8.4'
    arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
    pkgrel=4
    license=('BSD')

    ros_makedepends=(ros-melodic-mbf-costmap-core
  ros-melodic-interactive-markers
  ros-melodic-tf2-eigen
  ros-melodic-costmap-2d
  ros-melodic-costmap-converter
  ros-melodic-pluginlib
  ros-melodic-mbf-msgs
  ros-melodic-visualization-msgs
  ros-melodic-nav-core
  ros-melodic-nav-msgs
  ros-melodic-std-msgs
  ros-melodic-cmake-modules
  ros-melodic-geometry-msgs
  ros-melodic-catkin
  ros-melodic-roscpp
  ros-melodic-tf2-geometry-msgs
  ros-melodic-base-local-planner
  ros-melodic-message-generation
  ros-melodic-tf2-ros
  ros-melodic-tf2
  ros-melodic-dynamic-reconfigure
  ros-melodic-libg2o)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

    ros_depends=(ros-melodic-mbf-costmap-core
  ros-melodic-visualization-msgs
  ros-melodic-base-local-planner
  ros-melodic-interactive-markers
  ros-melodic-nav-core
  ros-melodic-roscpp
  ros-melodic-nav-msgs
  ros-melodic-costmap-2d
  ros-melodic-message-runtime
  ros-melodic-costmap-converter
  ros-melodic-pluginlib
  ros-melodic-tf2
  ros-melodic-mbf-msgs
  ros-melodic-dynamic-reconfigure
  ros-melodic-std-msgs
  ros-melodic-tf2-ros
  ros-melodic-geometry-msgs
  ros-melodic-libg2o)
    depends=(${ros_depends[@]}
    )
    
    # Tarball version (faster download)
    _dir="teb_local_planner-release-release-melodic-teb_local_planner"
    source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rst-tu-dortmund/teb_local_planner-release/archive/release/melodic/teb_local_planner/${pkgver}.tar.gz")
    sha256sums=('110f4beecfe1bfb624242217c692c944a8e25ea2daf00af385751518df20d109')

    build() {
        # Use ROS environment variables
        source /usr/share/ros-build-tools/clear-ros-env.sh
        [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

        # Create build directory
        [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
        cd ${srcdir}/build

        # Fix Python2/Python3 conflicts
        /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

        # Build project
        cmake ${srcdir}/${_dir} \
                -DCMAKE_BUILD_TYPE=Release \
                -DCATKIN_ENABLE_TESTING=0 \
                -DCATKIN_BUILD_BINARY_PACKAGE=ON \
                -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
                -DPYTHON_EXECUTABLE=/usr/bin/python3 \
                -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
                -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
                -DPYTHON_BASENAME=.cpython-37m \
                -DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69 \
		 -DBoost_NO_SYSTEM_PATHS=TRUE
    make
    }

    package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
    }
    