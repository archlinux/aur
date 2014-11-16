# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rosping is the tool to send ICMP ECHO_REQUEST to network hosts where roscore is running, and send back to you as rostopic message."
url='http://ros.org/wiki/rosping'

pkgname='ros-indigo-rosping'
pkgver='1.0.54'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Boost Software License, Version 1.0')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-std-msgs
  ros-indigo-rostest
  ros-indigo-catkin
  ros-indigo-rosboost-cfg
  ros-indigo-rosbuild
  ros-indigo-mk)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-std-msgs
  ros-indigo-roscpp)
depends=(${ros_depends[@]})

_tag=release/indigo/rosping/${pkgver}-${_pkgver_patch}
_dir=rosping
source=("${_dir}"::"git+https://github.com/tork-a/jsk_common-release.git"#tag=${_tag})
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
