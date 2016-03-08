# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - diagnostic_aggregator."
url='http://www.ros.org/wiki/diagnostic_aggregator'

pkgname='ros-indigo-diagnostic-aggregator'
pkgver='1.8.9'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-rostest
  ros-indigo-bondcpp
  ros-indigo-rospy
  ros-indigo-diagnostic-msgs
  ros-indigo-catkin
  ros-indigo-bondpy
  ros-indigo-pluginlib
  ros-indigo-xmlrpcpp)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-roscpp
  ros-indigo-bondcpp
  ros-indigo-rospy
  ros-indigo-diagnostic-msgs
  ros-indigo-bondpy
  ros-indigo-pluginlib
  ros-indigo-xmlrpcpp)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/diagnostic_aggregator/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/diagnostics-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="diagnostics-release-release-indigo-diagnostic_aggregator-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/diagnostics-release/archive/release/indigo/diagnostic_aggregator/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('c3467b04f0664974bfc0aa40e75b2f1581acac3ef4a240d8c91e71868a1caea0')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
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
