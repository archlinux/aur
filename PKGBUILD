# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - depthimage_to_laserscan."
url='http://ros.org/wiki/depthimage_to_laserscan'

pkgname='ros-indigo-depthimage-to-laserscan'
pkgver='1.0.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-image-geometry
  ros-indigo-roscpp
  ros-indigo-catkin
  ros-indigo-image-transport
  ros-indigo-sensor-msgs
  ros-indigo-dynamic-reconfigure
  ros-indigo-nodelet)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  gtest)

ros_depends=(ros-indigo-image-geometry
  ros-indigo-roscpp
  ros-indigo-image-transport
  ros-indigo-sensor-msgs
  ros-indigo-dynamic-reconfigure
  ros-indigo-nodelet)
depends=(${ros_depends[@]})

_tag=release/indigo/depthimage_to_laserscan/${pkgver}-${_pkgver_patch}
_dir=depthimage_to_laserscan
source=("${_dir}"::"git+https://github.com/ros-gbp/depthimage_to_laserscan-release.git"#tag=${_tag})
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
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
