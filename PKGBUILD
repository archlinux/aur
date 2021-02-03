# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="ROS - Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations."
url='https://github.com/googlecartographer/cartographer_ros'

pkgname='ros-noetic-cartographer-ros'
pkgver='1.0.0'
arch=('any')
pkgrel=3
license=('Apache 2.0')

ros_makedepends=(
  ros-noetic-tf2-ros
  ros-noetic-cartographer-ros-msgs
  ros-noetic-roslib
  ros-noetic-eigen-conversions
  ros-noetic-tf2
  ros-noetic-pcl-conversions
  ros-noetic-message-runtime
  ros-noetic-cartographer
  ros-noetic-urdf
  ros-noetic-rosbag
  ros-noetic-sensor-msgs
  ros-noetic-geometry-msgs
  ros-noetic-robot-state-publisher
  ros-noetic-nav-msgs
  ros-noetic-roslaunch
  ros-noetic-visualization-msgs
  ros-noetic-tf2-eigen
  ros-noetic-catkin
  ros-noetic-std-msgs
  ros-noetic-roscpp
)

makedepends=(
  cmake
  ros-build-tools
  google-glog
  protobuf
  gcc
  python-sphinx
  gflags
  gmock
  pcl
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-tf2-ros
  ros-noetic-cartographer-ros-msgs
  ros-noetic-roslib
  ros-noetic-eigen-conversions
  ros-noetic-tf2
  ros-noetic-pcl-conversions
  ros-noetic-message-runtime
  ros-noetic-cartographer
  ros-noetic-urdf
  ros-noetic-rosbag
  ros-noetic-sensor-msgs
  ros-noetic-geometry-msgs
  ros-noetic-robot-state-publisher
  ros-noetic-nav-msgs
  ros-noetic-roslaunch
  ros-noetic-visualization-msgs
  ros-noetic-tf2-eigen
  ros-noetic-std-msgs
  ros-noetic-roscpp
)
depends=(
  google-glog
  gflags
  pcl
  ${ros_depends[@]}
)

# Tarball version (faster download)
_dir="cartographer_ros-release-release-melodic-cartographer_ros"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-gbp/cartographer_ros-release/archive/release/melodic/cartographer_ros/${pkgver}.tar.gz"
CMakeLists.patch)
sha256sums=('874e830d4b3e341cf7f53e66499f84e5f46bb9fda97cfe5d523cee6ec2ebd6d0'
'18bafe6a7b7c0a894ce2055ace65925dedab29aab0183f56ba01cb8937013b86')

prepare() {
    cd "${srcdir}/${_dir}"
    patch -uN CMakeLists.txt ../CMakeLists.patch || return 1
}

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    rm -f ${srcdir}/${_dir}/cartographer/mapping/3d/hybrid_grid_test.cc

    # Build project
    cmake ${srcdir}/${_dir} \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_ENABLE_TESTING=0 \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
            -DPYTHON_LIBRARY=/usr/lib/libpython3.9.so \
            -DPYTHON_BASENAME=-python3.9 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF
            make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
