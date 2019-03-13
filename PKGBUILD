# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The core rosbridge package, repsonsible for interpreting JSON andperforming the appropriate ROS action, like subscribe, publish, call service, and interact with params."
url='http://ros.org/wiki/rosbridge_library'

pkgname='ros-kinetic-rosbridge-library'
pkgver='0.10.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-std-msgs
  ros-kinetic-catkin
  ros-kinetic-message-generation
  ros-kinetic-rospy
  ros-kinetic-geometry-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-pillow
  python2-pymongo)

ros_depends=(ros-kinetic-rosservice
  ros-kinetic-rosgraph
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-std-msgs
  ros-kinetic-message-runtime
  ros-kinetic-rospy
  ros-kinetic-rostopic)
depends=(${ros_depends[@]}
  python2-pillow
  python2-pymongo)

_tag=release/kinetic/rosbridge_library/${pkgver}-${_pkgver_patch}
_dir=rosbridge_library
source=("${_dir}"::"git+https://github.com/RobotWebTools-release/rosbridge_suite-release.git"#tag=${_tag})
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
