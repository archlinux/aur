# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The move_base package provides an implementation of an action (see the actionlib package) that, given a goal in the world, will attempt to reach it with a mobile base."
url='http://wiki.ros.org/move_base'

pkgname='ros-jade-move-base'
pkgver='1.13.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-nav-core
  ros-jade-tf
  ros-jade-catkin
  ros-jade-roscpp
  ros-jade-geometry-msgs
  ros-jade-std-msgs
  ros-jade-rotate-recovery
  ros-jade-base-local-planner
  ros-jade-clear-costmap-recovery
  ros-jade-rospy
  ros-jade-navfn
  ros-jade-costmap-2d
  ros-jade-message-generation
  ros-jade-std-srvs
  ros-jade-actionlib
  ros-jade-visualization-msgs
  ros-jade-move-base-msgs
  ros-jade-cmake-modules
  ros-jade-dynamic-reconfigure
  ros-jade-nav-msgs
  ros-jade-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-nav-core
  ros-jade-navfn
  ros-jade-roscpp
  ros-jade-geometry-msgs
  ros-jade-message-runtime
  ros-jade-base-local-planner
  ros-jade-clear-costmap-recovery
  ros-jade-rospy
  ros-jade-std-msgs
  ros-jade-costmap-2d
  ros-jade-nav-msgs
  ros-jade-std-srvs
  ros-jade-actionlib
  ros-jade-visualization-msgs
  ros-jade-move-base-msgs
  ros-jade-tf
  ros-jade-dynamic-reconfigure
  ros-jade-rotate-recovery
  ros-jade-pluginlib)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/jade/move_base/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-jade-move_base-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/jade/move_base/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('71e1861dc9871c1ab24f11a169c151fe942dde3377650913523031af260ea3d2')

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
