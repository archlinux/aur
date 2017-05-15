# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Extra nodes and plugins for MAVROS."
url='http://wiki.ros.org/mavros_extras'

pkgname='ros-kinetic-mavros-extras'
pkgver='0.19.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPLv3, LGPLv3, BSD')

ros_makedepends=(ros-kinetic-mavros
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-std-msgs
  ros-kinetic-cv-bridge
  ros-kinetic-catkin
  ros-kinetic-image-transport
  ros-kinetic-mavros-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-cmake-modules
  ros-kinetic-urdf
  ros-kinetic-visualization-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-mavros
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-std-msgs
  ros-kinetic-cv-bridge
  ros-kinetic-image-transport
  ros-kinetic-mavros-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-urdf
  ros-kinetic-visualization-msgs)
depends=(${ros_depends[@]})

_tag=release/kinetic/mavros_extras/${pkgver}-${_pkgver_patch}
_dir=mavros_extras
source=("${_dir}"::"git+https://github.com/mavlink/mavros-release.git"#tag=${_tag})
md5sums=('SKIP')

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
