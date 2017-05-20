# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Provides nodes to assemble point clouds from either LaserScan or PointCloud messages."
url='http://ros.org/wiki/laser_assembler'

pkgname='ros-lunar-laser-assembler'
pkgver='1.7.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-message-filters
  ros-lunar-roscpp
  ros-lunar-tf
  ros-lunar-laser-geometry
  ros-lunar-pluginlib
  ros-lunar-filters
  ros-lunar-rostest
  ros-lunar-sensor-msgs
  ros-lunar-catkin
  ros-lunar-message-generation)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-lunar-message-filters
  ros-lunar-roscpp
  ros-lunar-tf
  ros-lunar-laser-geometry
  ros-lunar-pluginlib
  ros-lunar-filters
  ros-lunar-sensor-msgs
  ros-lunar-message-runtime)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/laser_assembler/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/laser_assembler-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="laser_assembler-release-release-lunar-laser_assembler-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/laser_assembler-release/archive/release/lunar/laser_assembler/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('8caa3924c6a926d5baab4adeb575763012b8cd2f2dda456a8458b645afbf0930')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
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
