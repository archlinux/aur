# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package provides an implementation of a 2D costmap."
url='http://wiki.ros.org/costmap_2d'

pkgname='ros-jade-costmap-2d'
pkgver='1.12.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-tf
  ros-jade-pcl-ros
  ros-jade-catkin
  ros-jade-roscpp
  ros-jade-geometry-msgs
  ros-jade-std-msgs
  ros-jade-rostest
  ros-jade-sensor-msgs
  ros-jade-nav-msgs
  ros-jade-message-generation
  ros-jade-map-msgs
  ros-jade-pcl-conversions
  ros-jade-voxel-grid
  ros-jade-visualization-msgs
  ros-jade-laser-geometry
  ros-jade-cmake-modules
  ros-jade-dynamic-reconfigure
  ros-jade-message-filters
  ros-jade-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-tf
  ros-jade-pcl-ros
  ros-jade-roscpp
  ros-jade-geometry-msgs
  ros-jade-std-msgs
  ros-jade-rostest
  ros-jade-sensor-msgs
  ros-jade-message-runtime
  ros-jade-rosconsole
  ros-jade-nav-msgs
  ros-jade-map-msgs
  ros-jade-pcl-conversions
  ros-jade-voxel-grid
  ros-jade-visualization-msgs
  ros-jade-laser-geometry
  ros-jade-dynamic-reconfigure
  ros-jade-message-filters
  ros-jade-pluginlib)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/jade/costmap_2d/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-jade-costmap_2d"
source=("navigation-release-debian-jade-costmap_2d.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/jade/costmap_2d.tar.gz")
sha256sums=('76f0f70b82809434c6ec0345889e8ca1f0dbd3a1f0cdb2e4012ba660f5c84f88')

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
