# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package provides implementations of the Trajectory Rollout and Dynamic Window approaches to local robot navigation on a plane."
url='http://wiki.ros.org/base_local_planner'

pkgname='ros-indigo-base-local-planner'
pkgver='1.11.11'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-nav-core
  ros-indigo-dynamic-reconfigure
  ros-indigo-pcl-ros
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-rospy
  ros-indigo-costmap-2d
  ros-indigo-message-generation
  ros-indigo-rosconsole
  ros-indigo-pcl-conversions
  ros-indigo-voxel-grid
  ros-indigo-visualization-msgs
  ros-indigo-catkin
  ros-indigo-angles
  ros-indigo-cmake-modules
  ros-indigo-tf
  ros-indigo-nav-msgs
  ros-indigo-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-indigo-nav-core
  ros-indigo-dynamic-reconfigure
  ros-indigo-pcl-ros
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-rospy
  ros-indigo-costmap-2d
  ros-indigo-message-generation
  ros-indigo-rosconsole
  ros-indigo-voxel-grid
  ros-indigo-visualization-msgs
  ros-indigo-angles
  ros-indigo-tf
  ros-indigo-nav-msgs
  ros-indigo-pluginlib)
depends=(${ros_depends[@]}
  eigen3)

_tag=release/indigo/base_local_planner/${pkgver}-${_pkgver_patch}
_dir=base_local_planner
source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
md5sums=('SKIP')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
