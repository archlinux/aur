# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package provides an implementation of a 2D costmap."
url='http://wiki.ros.org/costmap_2d'

pkgname='ros-indigo-costmap-2d'
pkgver='1.12.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-tf
  ros-indigo-pcl-ros
  ros-indigo-catkin
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-rostest
  ros-indigo-sensor-msgs
  ros-indigo-nav-msgs
  ros-indigo-message-generation
  ros-indigo-map-msgs
  ros-indigo-pcl-conversions
  ros-indigo-voxel-grid
  ros-indigo-visualization-msgs
  ros-indigo-laser-geometry
  ros-indigo-cmake-modules
  ros-indigo-dynamic-reconfigure
  ros-indigo-message-filters
  ros-indigo-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-tf
  ros-indigo-pcl-ros
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-rostest
  ros-indigo-sensor-msgs
  ros-indigo-message-runtime
  ros-indigo-rosconsole
  ros-indigo-nav-msgs
  ros-indigo-map-msgs
  ros-indigo-pcl-conversions
  ros-indigo-voxel-grid
  ros-indigo-visualization-msgs
  ros-indigo-laser-geometry
  ros-indigo-dynamic-reconfigure
  ros-indigo-message-filters
  ros-indigo-pluginlib)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/costmap_2d/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-indigo-costmap_2d-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/indigo/costmap_2d/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('57de1b359f17420de9e91aaa3b2061917983fa08aad6fd7b4df5293757d70a88')

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
