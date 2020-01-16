# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations."
    url='https://github.com/googlecartographer/cartographer_ros'

    pkgname='ros-melodic-cartographer-ros'
    pkgver='1.0.0'
    arch=('any')
    pkgrel=1
    license=('Apache 2.0')

    ros_makedepends=(ros-melodic-tf2-ros
  ros-melodic-cartographer-ros-msgs
  ros-melodic-roslib
  ros-melodic-eigen-conversions
  ros-melodic-tf2
  ros-melodic-pcl-conversions
  ros-melodic-message-runtime
  ros-melodic-cartographer
  ros-melodic-urdf
  ros-melodic-rosbag
  ros-melodic-sensor-msgs
  ros-melodic-geometry-msgs
  ros-melodic-robot-state-publisher
  ros-melodic-nav-msgs
  ros-melodic-roslaunch
  ros-melodic-visualization-msgs
  ros-melodic-tf2-eigen
  ros-melodic-catkin
  ros-melodic-std-msgs
  ros-melodic-roscpp)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    google-glog
  protobuf
  gcc
  python-sphinx
  gflags
  gmock
  pcl)

    ros_depends=(ros-melodic-tf2-ros
  ros-melodic-cartographer-ros-msgs
  ros-melodic-roslib
  ros-melodic-eigen-conversions
  ros-melodic-tf2
  ros-melodic-pcl-conversions
  ros-melodic-message-runtime
  ros-melodic-cartographer
  ros-melodic-urdf
  ros-melodic-rosbag
  ros-melodic-sensor-msgs
  ros-melodic-geometry-msgs
  ros-melodic-robot-state-publisher
  ros-melodic-nav-msgs
  ros-melodic-roslaunch
  ros-melodic-visualization-msgs
  ros-melodic-tf2-eigen
  ros-melodic-std-msgs
  ros-melodic-roscpp)
    depends=(${ros_depends[@]}
    google-glog
  gflags
  pcl)
    
    # Tarball version (faster download)
    _dir="cartographer_ros-release-release-melodic-cartographer_ros"
    source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-gbp/cartographer_ros-release/archive/release/melodic/cartographer_ros/${pkgver}.tar.gz")
    sha256sums=('874e830d4b3e341cf7f53e66499f84e5f46bb9fda97cfe5d523cee6ec2ebd6d0')

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
                -DCATKIN_BUILD_BINARY_PACKAGE=ON \
                -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
                -DPYTHON_EXECUTABLE=/usr/bin/python3 \
                -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
                -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
                -DPYTHON_BASENAME=.cpython-38 \
                -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
    }

    package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
    }
    
