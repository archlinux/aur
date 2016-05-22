# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Time and Duration implementations for C++ libraries, including roscpp."
url='http://ros.org/wiki/rostime'

pkgname='ros-jade-rostime'
pkgver='0.5.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-cpp-common
  ros-jade-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-jade-cpp-common)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/jade/rostime/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/roscpp_core-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="roscpp_core-release-release-jade-rostime-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/roscpp_core-release/archive/release/jade/rostime/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('33f2c6d59ab2a9864d2e1b3f07ad66f7dd0b9088d2c98701cd3127798542b530')

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
