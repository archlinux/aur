# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains a C++ parser for the Unified Robot Description Format (URDF), which is an XML format for representing a robot model."
url='http://ros.org/wiki/urdf'

pkgname='ros-indigo-urdf'
pkgver='1.11.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-rostest
  ros-indigo-catkin
  ros-indigo-urdf-parser-plugin
  ros-indigo-rosconsole-bridge
  ros-indigo-cmake-modules
  ros-indigo-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  urdfdom
  urdfdom-headers)

ros_depends=(ros-indigo-urdf-parser-plugin
  ros-indigo-rosconsole-bridge
  ros-indigo-pluginlib
  ros-indigo-roscpp)
depends=(${ros_depends[@]}
  urdfdom
  urdfdom-headers)

_tag=release/indigo/urdf/${pkgver}-${_pkgver_patch}
_dir=urdf
source=("${_dir}"::"git+https://github.com/ros-gbp/robot_model-release.git"#tag=${_tag})
md5sums=('SKIP')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
