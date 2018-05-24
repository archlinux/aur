# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - diagnostic_aggregator."
url='http://www.ros.org/wiki/diagnostic_aggregator'

pkgname='ros-kinetic-diagnostic-aggregator'
pkgver='1.9.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-pluginlib
  ros-kinetic-bondcpp
  ros-kinetic-roscpp
  ros-kinetic-rospy
  ros-kinetic-diagnostic-msgs
  ros-kinetic-xmlrpcpp
  ros-kinetic-bondpy
  ros-kinetic-rostest
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-pluginlib
  ros-kinetic-bondcpp
  ros-kinetic-roscpp
  ros-kinetic-rospy
  ros-kinetic-diagnostic-msgs
  ros-kinetic-xmlrpcpp
  ros-kinetic-bondpy)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/diagnostic_aggregator/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/diagnostics-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="diagnostics-release-release-kinetic-diagnostic_aggregator-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/diagnostics-release/archive/release/kinetic/diagnostic_aggregator/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('d57390287aaa8d8b86d146c67802505de9fee725577fb41c6ff2cbc404816b95')

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
