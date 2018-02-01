# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The robot_localization package provides nonlinear state estimation through sensor fusion of an abritrary number of sensors."
url='http://ros.org/wiki/robot_localization'

pkgname='ros-kinetic-robot-localization'
pkgver='2.4.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-tf2-ros
  ros-kinetic-geographic-msgs
  ros-kinetic-diagnostic-updater
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-std-msgs
  ros-kinetic-diagnostic-msgs
  ros-kinetic-message-filters
  ros-kinetic-message-generation
  ros-kinetic-sensor-msgs
  ros-kinetic-cmake-modules
  ros-kinetic-catkin
  ros-kinetic-tf2-geometry-msgs
  ros-kinetic-nav-msgs
  ros-kinetic-tf2
  ros-kinetic-roslint
  ros-kinetic-eigen-conversions)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3
  cmake)

ros_depends=(ros-kinetic-tf2-ros
  ros-kinetic-geographic-msgs
  ros-kinetic-diagnostic-updater
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-std-msgs
  ros-kinetic-message-runtime
  ros-kinetic-diagnostic-msgs
  ros-kinetic-message-filters
  ros-kinetic-sensor-msgs
  ros-kinetic-cmake-modules
  ros-kinetic-tf2-geometry-msgs
  ros-kinetic-nav-msgs
  ros-kinetic-tf2
  ros-kinetic-eigen-conversions)
depends=(${ros_depends[@]}
  eigen3)

_tag=release/kinetic/robot_localization/${pkgver}-${_pkgver_patch}
_dir=robot_localization
source=("${_dir}"::"git+https://github.com/cra-ros-pkg/robot_localization-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
