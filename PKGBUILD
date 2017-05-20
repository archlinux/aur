# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package provides ROS specific hooks for stage."
url='http://ros.org/wiki/stage_ros'

pkgname='ros-lunar-stage-ros'
pkgver='1.8.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-std-srvs
  ros-lunar-catkin
  ros-lunar-roscpp
  ros-lunar-stage
  ros-lunar-tf
  ros-lunar-sensor-msgs
  ros-lunar-geometry-msgs
  ros-lunar-rostest
  ros-lunar-nav-msgs
  ros-lunar-std-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-lunar-std-srvs
  ros-lunar-roscpp
  ros-lunar-stage
  ros-lunar-tf
  ros-lunar-sensor-msgs
  ros-lunar-std-msgs
  ros-lunar-nav-msgs
  ros-lunar-geometry-msgs)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/lunar/stage_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/stage_ros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="stage_ros-release-release-lunar-stage_ros-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/stage_ros-release/archive/release/lunar/stage_ros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('01b33012f5130a01635991e691effa5df4f70a144e4f4edcc652531e8cb0ef22')

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
