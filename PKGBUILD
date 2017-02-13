# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Provides ROS plugins that offer message and service publishers for interfacing with Gazebo through ROS."
url='http://gazebosim.org/tutorials?cat=connect_ros'

pkgname='ros-kinetic-gazebo-ros'
pkgver='2.5.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache 2.0')

ros_makedepends=(ros-kinetic-cmake-modules
  ros-kinetic-tf
  ros-kinetic-message-generation
  ros-kinetic-geometry-msgs
  ros-kinetic-gazebo-msgs
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-rosgraph-msgs
  ros-kinetic-std-srvs
  ros-kinetic-roslib
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  gazebo
  tinyxml)

ros_depends=(ros-kinetic-tf
  ros-kinetic-message-generation
  ros-kinetic-geometry-msgs
  ros-kinetic-gazebo-msgs
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-rosgraph-msgs
  ros-kinetic-std-srvs
  ros-kinetic-roslib)
depends=(${ros_depends[@]}
  gazebo
  tinyxml)

# Git version (e.g. for debugging)
# _tag=release/kinetic/gazebo_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/gazebo_ros_pkgs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="gazebo_ros_pkgs-release-release-kinetic-gazebo_ros-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/kinetic/gazebo_ros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('da6ce1f176210ba6b871133d00cde0cadf574ef55c27e028f6eb6ce3d6f00d73')

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
