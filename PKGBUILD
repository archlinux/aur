# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package provides implementations of the Trajectory Rollout and Dynamic Window approaches to local robot navigation on a plane."
url='http://wiki.ros.org/base_local_planner'

pkgname='ros-kinetic-base-local-planner'
pkgver='1.16.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-nav-core
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-pcl-ros
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-std-msgs
  ros-kinetic-rospy
  ros-kinetic-costmap-2d
  ros-kinetic-message-generation
  ros-kinetic-rosconsole
  ros-kinetic-pcl-conversions
  ros-kinetic-voxel-grid
  ros-kinetic-visualization-msgs
  ros-kinetic-catkin
  ros-kinetic-angles
  ros-kinetic-cmake-modules
  ros-kinetic-tf
  ros-kinetic-nav-msgs
  ros-kinetic-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-kinetic-nav-core
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-pcl-ros
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-std-msgs
  ros-kinetic-rospy
  ros-kinetic-costmap-2d
  ros-kinetic-message-generation
  ros-kinetic-rosconsole
  ros-kinetic-voxel-grid
  ros-kinetic-visualization-msgs
  ros-kinetic-angles
  ros-kinetic-tf
  ros-kinetic-nav-msgs
  ros-kinetic-pluginlib)
depends=(${ros_depends[@]}
  eigen3)

# Git version (e.g. for debugging)
# _tag=release/kinetic/base_local_planner/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-kinetic-base_local_planner"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/kinetic/base_local_planner.tar.gz")
sha256sums=('64b643dc3a6c3822a73ff095c5ef03a40a2d7c09292690f1bf7ea5f254be204f')

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
