# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MAVROS -- MAVLink extendable communication node for ROS with proxy for Ground Control Station."
url='http://wiki.ros.org/mavros'

pkgname='ros-indigo-mavros'
pkgver='0.11.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPLv3, LGPLv3, BSD')

ros_makedepends=(ros-indigo-libmavconn
  ros-indigo-diagnostic-updater
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-catkin
  ros-indigo-rospy
  ros-indigo-diagnostic-msgs
  ros-indigo-std-srvs
  ros-indigo-message-generation
  ros-indigo-rosconsole-bridge
  ros-indigo-sensor-msgs
  ros-indigo-angles
  ros-indigo-mavlink
  ros-indigo-tf
  ros-indigo-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-indigo-libmavconn
  ros-indigo-diagnostic-updater
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-rospy
  ros-indigo-diagnostic-msgs
  ros-indigo-std-srvs
  ros-indigo-message-generation
  ros-indigo-rosconsole-bridge
  ros-indigo-sensor-msgs
  ros-indigo-angles
  ros-indigo-mavlink
  ros-indigo-tf
  ros-indigo-pluginlib)
depends=(${ros_depends[@]}
  boost
  python2)

_tag=release/indigo/mavros/${pkgver}-${_pkgver_patch}
_dir=mavros
source=("${_dir}"::"git+https://github.com/mavlink/mavros-release.git"#tag=${_tag})
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
