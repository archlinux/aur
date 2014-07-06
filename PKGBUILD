# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The wiimote package allows ROS nodes to communicate with a Nintendo Wiimote and its related peripherals, including the Nunchuk, Motion Plus, and (experimentally) the Classic."
url='http://www.ros.org/wiki/wiimote'

pkgname='ros-indigo-wiimote'
pkgver='1.10.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPL')

ros_makedepends=(ros-indigo-geometry-msgs
  ros-indigo-genmsg
  ros-indigo-std-msgs
  ros-indigo-rospy
  ros-indigo-std-srvs
  ros-indigo-sensor-msgs
  ros-indigo-roslib
  ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  cwiid
  python2-numpy)

ros_depends=(ros-indigo-geometry-msgs
  ros-indigo-genmsg
  ros-indigo-std-msgs
  ros-indigo-rospy
  ros-indigo-std-srvs
  ros-indigo-sensor-msgs
  ros-indigo-roslib)
depends=(${ros_depends[@]}
  cwiid
  python2-numpy)

_tag=release/indigo/wiimote/${pkgver}-${_pkgver_patch}
_dir=wiimote
source=("${_dir}"::"git+https://github.com/ros-gbp/joystick_drivers-release.git"#tag=${_tag})
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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
