# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains the ROS bindings for the tf2 library, for both Python and C++."
url='http://www.ros.org/wiki/tf2_ros'

pkgname='ros-lunar-tf2-ros'
pkgver='0.5.16'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-actionlib
  ros-lunar-tf2
  ros-lunar-message-filters
  ros-lunar-roscpp
  ros-lunar-rosgraph
  ros-lunar-tf2-py
  ros-lunar-xmlrpcpp
  ros-lunar-rospy
  ros-lunar-geometry-msgs
  ros-lunar-std-msgs
  ros-lunar-catkin
  ros-lunar-tf2-msgs
  ros-lunar-actionlib-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-lunar-actionlib
  ros-lunar-tf2
  ros-lunar-message-filters
  ros-lunar-roscpp
  ros-lunar-rosgraph
  ros-lunar-tf2-py
  ros-lunar-xmlrpcpp
  ros-lunar-rospy
  ros-lunar-geometry-msgs
  ros-lunar-std-msgs
  ros-lunar-tf2-msgs
  ros-lunar-actionlib-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/tf2_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/geometry2-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geometry2-release-release-lunar-tf2_ros-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/geometry2-release/archive/release/lunar/tf2_ros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('f229904916fe1848559513e3c5ba32755f9132d11604f384c2441ee6348ac9d7')

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
