# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MAVROS -- MAVLink extendable communication node for ROS with proxy for Ground Control Station."
url='http://wiki.ros.org/mavros'

pkgname='ros-jade-mavros'
pkgver='0.17.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPLv3, LGPLv3, BSD')

ros_makedepends=(ros-jade-libmavconn
  ros-jade-tf2-ros
  ros-jade-diagnostic-updater
  ros-jade-roscpp
  ros-jade-geometry-msgs
  ros-jade-std-msgs
  ros-jade-angles
  ros-jade-diagnostic-msgs
  ros-jade-std-srvs
  ros-jade-rosconsole-bridge
  ros-jade-mavros-msgs
  ros-jade-sensor-msgs
  ros-jade-cmake-modules
  ros-jade-mavlink
  ros-jade-catkin
  ros-jade-eigen-conversions
  ros-jade-nav-msgs
  ros-jade-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  eigen3)

ros_depends=(ros-jade-libmavconn
  ros-jade-tf2-ros
  ros-jade-diagnostic-updater
  ros-jade-roscpp
  ros-jade-geometry-msgs
  ros-jade-std-msgs
  ros-jade-message-runtime
  ros-jade-rospy
  ros-jade-diagnostic-msgs
  ros-jade-std-srvs
  ros-jade-rosconsole-bridge
  ros-jade-mavros-msgs
  ros-jade-sensor-msgs
  ros-jade-mavlink
  ros-jade-eigen-conversions
  ros-jade-nav-msgs
  ros-jade-pluginlib)
depends=(${ros_depends[@]}
  boost
  eigen3)

_tag=release/jade/mavros/${pkgver}-${_pkgver_patch}
_dir=mavros
source=("${_dir}"::"git+https://github.com/mavlink/mavros-release.git"#tag=${_tag})
md5sums=('SKIP')

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
