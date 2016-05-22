# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Tools for directing, throttling, selecting, and otherwise messing with ROS topics at a meta level."
url='http://ros.org/wiki/topic_tools'

pkgname='ros-jade-topic-tools'
pkgver='1.11.19'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-rosunit
  ros-jade-rostest
  ros-jade-std-msgs
  ros-jade-message-generation
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-xmlrpcpp
  ros-jade-rosconsole
  ros-jade-cpp-common
  ros-jade-rostime)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-std-msgs
  ros-jade-message-runtime
  ros-jade-roscpp
  ros-jade-xmlrpcpp
  ros-jade-rosconsole
  ros-jade-rostime)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/jade/topic_tools/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-jade-topic_tools-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/jade/topic_tools/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('87a6c0b9b8988a8770d6f70c8f2f68d9fe5151e3ed4161be3e7b61ffe812d5f1')

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
