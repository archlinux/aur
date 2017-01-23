# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package provides implementations of the Trajectory Rollout and Dynamic Window approaches to local robot navigation on a plane."
url='http://wiki.ros.org/base_local_planner'

pkgname='ros-jade-base-local-planner'
pkgver='1.12.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-nav-core
  ros-jade-dynamic-reconfigure
  ros-jade-pcl-ros
  ros-jade-roscpp
  ros-jade-geometry-msgs
  ros-jade-std-msgs
  ros-jade-rospy
  ros-jade-costmap-2d
  ros-jade-message-generation
  ros-jade-rosconsole
  ros-jade-pcl-conversions
  ros-jade-voxel-grid
  ros-jade-visualization-msgs
  ros-jade-catkin
  ros-jade-angles
  ros-jade-cmake-modules
  ros-jade-tf
  ros-jade-nav-msgs
  ros-jade-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-jade-nav-core
  ros-jade-dynamic-reconfigure
  ros-jade-pcl-ros
  ros-jade-roscpp
  ros-jade-geometry-msgs
  ros-jade-std-msgs
  ros-jade-rospy
  ros-jade-costmap-2d
  ros-jade-message-generation
  ros-jade-rosconsole
  ros-jade-voxel-grid
  ros-jade-visualization-msgs
  ros-jade-angles
  ros-jade-tf
  ros-jade-nav-msgs
  ros-jade-pluginlib)
depends=(${ros_depends[@]}
  eigen3)

# Git version (e.g. for debugging)
# _tag=release/jade/base_local_planner/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-jade-base_local_planner"
source=("navigation-release-release-jade-base_local_planner.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/jade/base_local_planner.tar.gz")
sha256sums=('8eb29cfae01e34eb2a2fb6c6c45be7b19bbdc1f38ed9ee25ac5f99188dc976e7')

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
