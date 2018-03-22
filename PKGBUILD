# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Utility functions for displaying and debugging data in Rviz via published markers."
url='https://github.com/davetcoleman/rviz_visual_tools'

pkgname='ros-kinetic-rviz-visual-tools'
pkgver='3.6.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-roslint
  ros-kinetic-visualization-msgs
  ros-kinetic-trajectory-msgs
  ros-kinetic-geometry-msgs
  ros-kinetic-eigen-stl-containers
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-rviz
  ros-kinetic-sensor-msgs
  ros-kinetic-graph-msgs
  ros-kinetic-tf-conversions
  ros-kinetic-eigen-conversions
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt5-x11extras)

ros_depends=(ros-kinetic-roslint
  ros-kinetic-visualization-msgs
  ros-kinetic-trajectory-msgs
  ros-kinetic-geometry-msgs
  ros-kinetic-eigen-stl-containers
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-rviz
  ros-kinetic-sensor-msgs
  ros-kinetic-graph-msgs
  ros-kinetic-tf-conversions
  ros-kinetic-eigen-conversions)
depends=(${ros_depends[@]}
  qt5-x11extras)

# Git version (e.g. for debugging)
# _tag=release/kinetic/rviz_visual_tools/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/davetcoleman/rviz_visual_tools-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rviz_visual_tools-release-release-kinetic-rviz_visual_tools-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/davetcoleman/rviz_visual_tools-release/archive/release/kinetic/rviz_visual_tools/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('c31874ae535654e6ef65b52efae8b86799ffcbe0afadf58e13dc22838dd754b6')

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
