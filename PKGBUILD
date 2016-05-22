# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package allows you to publish the state of a robot to tf."
url='http://wiki.ros.org/robot_state_publisher'

pkgname='ros-jade-robot-state-publisher'
pkgver='1.12.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-cmake-modules
  ros-jade-rostest
  ros-jade-orocos-kdl
  ros-jade-kdl-parser
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-tf2-ros
  ros-jade-tf2-kdl
  ros-jade-tf
  ros-jade-sensor-msgs
  ros-jade-rosconsole
  ros-jade-rostime)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-jade-orocos-kdl
  ros-jade-kdl-parser
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-tf2-ros
  ros-jade-tf2-kdl
  ros-jade-tf
  ros-jade-sensor-msgs
  ros-jade-rosconsole
  ros-jade-rostime)
depends=(${ros_depends[@]}
  eigen3)

# Git version (e.g. for debugging)
# _tag=release/jade/robot_state_publisher/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/robot_state_publisher-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="robot_state_publisher-release-release-jade-robot_state_publisher-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/robot_state_publisher-release/archive/release/jade/robot_state_publisher/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('70a739b817ce738b2dd9673b34827ca976627db15068e8c22b90826fe1eb2393')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
