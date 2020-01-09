# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Utility functions for displaying and debugging data in Rviz via published markers."
url='https://github.com/davetcoleman/rviz_visual_tools'

pkgname='ros-melodic-rviz-visual-tools'
pkgver='3.8.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-roslint
  ros-melodic-visualization-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-geometry-msgs
  ros-melodic-eigen-stl-containers
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-rviz
  ros-melodic-sensor-msgs
  ros-melodic-graph-msgs
  ros-melodic-tf-conversions
  ros-melodic-eigen-conversions
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt5-x11extras)

ros_depends=(ros-melodic-roslint
  ros-melodic-visualization-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-geometry-msgs
  ros-melodic-eigen-stl-containers
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-rviz
  ros-melodic-sensor-msgs
  ros-melodic-graph-msgs
  ros-melodic-tf-conversions
  ros-melodic-eigen-conversions)
depends=(${ros_depends[@]}
  qt5-x11extras)

# Git version (e.g. for debugging)
# _tag=release/melodic/rviz_visual_tools/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/davetcoleman/rviz_visual_tools-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rviz_visual_tools-release-release-melodic-rviz_visual_tools"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/davetcoleman/rviz_visual_tools-release/archive/release/melodic/rviz_visual_tools/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('b56e899fa3bb3650e323c5145806805200c17256f1836cd572e4d3631e2e7e90')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
        -DPYTHON_BASENAME=-python3.8 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
