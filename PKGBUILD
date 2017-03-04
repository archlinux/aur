# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - turtle_actionlib demonstrates how to write an action server and client with the turtlesim."
url='http://ros.org/wiki/turtle_actionlib'

pkgname='ros-kinetic-turtle-actionlib'
pkgver='0.1.10'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-geometry-msgs
  ros-kinetic-message-generation
  ros-kinetic-actionlib-msgs
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-turtlesim
  ros-kinetic-actionlib
  ros-kinetic-angles
  ros-kinetic-rosconsole
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-geometry-msgs
  ros-kinetic-actionlib-msgs
  ros-kinetic-message-runtime
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-turtlesim
  ros-kinetic-actionlib
  ros-kinetic-angles
  ros-kinetic-rosconsole)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/turtle_actionlib/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/common_tutorials-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="common_tutorials-release-release-kinetic-turtle_actionlib-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/common_tutorials-release/archive/release/kinetic/turtle_actionlib/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('5ec375f3e1c2041fe01e5aede68707d17aa23c97c8e0648469be7f25b2c7c953')

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
