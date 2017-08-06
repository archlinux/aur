# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - diagnostic_aggregator."
url='http://www.ros.org/wiki/diagnostic_aggregator'

pkgname='ros-lunar-diagnostic-aggregator'
pkgver='1.9.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-xmlrpcpp
  ros-lunar-roscpp
  ros-lunar-diagnostic-msgs
  ros-lunar-pluginlib
  ros-lunar-rospy
  ros-lunar-bondcpp
  ros-lunar-rostest
  ros-lunar-bondpy
  ros-lunar-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-lunar-xmlrpcpp
  ros-lunar-roscpp
  ros-lunar-diagnostic-msgs
  ros-lunar-pluginlib
  ros-lunar-rospy
  ros-lunar-bondcpp
  ros-lunar-bondpy)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/diagnostic_aggregator/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/diagnostics-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="diagnostics-release-release-lunar-diagnostic_aggregator-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/diagnostics-release/archive/release/lunar/diagnostic_aggregator/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('6168e1c53ceb1ec49a557a56c42ee97ea8702a9f54c3151cff8ee858838b1ea7')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
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
