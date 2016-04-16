# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package provides a recovery behavior for the navigation stack that attempts to clear space by performing a 360 degree rotation of the robot."
url='http://wiki.ros.org/rotate_recovery'

pkgname='ros-indigo-rotate-recovery'
pkgver='1.12.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-nav-core
  ros-indigo-roscpp
  ros-indigo-base-local-planner
  ros-indigo-costmap-2d
  ros-indigo-catkin
  ros-indigo-cmake-modules
  ros-indigo-tf
  ros-indigo-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-indigo-nav-core
  ros-indigo-tf
  ros-indigo-pluginlib
  ros-indigo-roscpp
  ros-indigo-costmap-2d)
depends=(${ros_depends[@]}
  eigen3)

# Git version (e.g. for debugging)
# _tag=release/indigo/rotate_recovery/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-indigo-rotate_recovery-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/indigo/rotate_recovery/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('7562e5b1a3e9b3e7ecbc42e4d89eba2d59a80cf1af88410d7639cd05f79daf90')

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
