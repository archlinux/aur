# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package provides an implementation of a 2D costmap"
url='http://wiki.ros.org/costmap_2d'

pkgname='ros-kinetic-costmap-2d'
pkgver='1.14.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-message-filters
  ros-kinetic-visualization-msgs
  ros-kinetic-pcl-conversions
  ros-kinetic-cmake-modules
  ros-kinetic-nav-msgs
  ros-kinetic-message-generation
  ros-kinetic-tf
  ros-kinetic-geometry-msgs
  ros-kinetic-roscpp
  ros-kinetic-std-msgs
  ros-kinetic-pluginlib
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-map-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-voxel-grid
  ros-kinetic-catkin
  ros-kinetic-pcl-ros
  ros-kinetic-rostest
  ros-kinetic-laser-geometry)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-message-filters
  ros-kinetic-visualization-msgs
  ros-kinetic-pcl-conversions
  ros-kinetic-nav-msgs
  ros-kinetic-tf
  ros-kinetic-geometry-msgs
  ros-kinetic-roscpp
  ros-kinetic-message-runtime
  ros-kinetic-std-msgs
  ros-kinetic-pluginlib
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-rostest
  ros-kinetic-map-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-voxel-grid
  ros-kinetic-pcl-ros
  ros-kinetic-rosconsole
  ros-kinetic-laser-geometry)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/costmap_2d/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-kinetic-costmap_2d-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/kinetic/costmap_2d/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('9feba9845d06711e12d90b28300db2a05fc3e0d2f6c318d1e218674b71cd70c2')

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
