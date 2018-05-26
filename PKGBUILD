# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Tools for directing, throttling, selecting, and otherwise messing with ROS topics at a meta level."
url='http://ros.org/wiki/topic_tools'

pkgname='ros-melodic-topic-tools'
pkgver='1.14.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-rosconsole
  ros-melodic-cpp-common
  ros-melodic-std-msgs
  ros-melodic-rostest
  ros-melodic-roscpp
  ros-melodic-xmlrpcpp
  ros-melodic-catkin
  ros-melodic-rosunit
  ros-melodic-rostime
  ros-melodic-message-generation)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-rosconsole
  ros-melodic-std-msgs
  ros-melodic-message-runtime
  ros-melodic-roscpp
  ros-melodic-xmlrpcpp
  ros-melodic-rostime)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/topic_tools/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-melodic-topic_tools-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/melodic/topic_tools/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('96ac8d66e3ed9d5ef6293c07ba89ea3d2e0875182307e395cc702076eb87e166')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
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
