# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MAVROS -- MAVLink extendable communication node for ROS with proxy for Ground Control Station."
url='http://wiki.ros.org/mavros'

pkgname='ros-kinetic-mavros'
pkgver='0.19.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPLv3, LGPLv3, BSD')

ros_makedepends=(ros-kinetic-libmavconn
  ros-kinetic-tf2-ros
  ros-kinetic-diagnostic-updater
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-std-msgs
  ros-kinetic-angles
  ros-kinetic-diagnostic-msgs
  ros-kinetic-std-srvs
  ros-kinetic-rosconsole-bridge
  ros-kinetic-mavros-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-cmake-modules
  ros-kinetic-mavlink
  ros-kinetic-catkin
  ros-kinetic-eigen-conversions
  ros-kinetic-nav-msgs
  ros-kinetic-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  eigen3)

ros_depends=(ros-kinetic-libmavconn
  ros-kinetic-tf2-ros
  ros-kinetic-diagnostic-updater
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-std-msgs
  ros-kinetic-message-runtime
  ros-kinetic-rospy
  ros-kinetic-diagnostic-msgs
  ros-kinetic-std-srvs
  ros-kinetic-rosconsole-bridge
  ros-kinetic-mavros-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-mavlink
  ros-kinetic-eigen-conversions
  ros-kinetic-nav-msgs
  ros-kinetic-pluginlib)
depends=(${ros_depends[@]}
  boost
  eigen3)

_tag=release/kinetic/mavros/${pkgver}-${_pkgver_patch}
_dir=mavros
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
