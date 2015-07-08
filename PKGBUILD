# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The core rosbridge package, repsonsible for interpreting JSON andperforming the appropriate ROS action, like subscribe, publish, call service, and interact with params."
url='http://ros.org/wiki/rosbridge_library'

pkgname='ros-indigo-rosbridge-library'
pkgver='0.6.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-rosservice
  ros-indigo-geometry-msgs
  ros-indigo-rospy
  ros-indigo-catkin
  ros-indigo-message-generation
  ros-indigo-rostopic)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-pillow)

ros_depends=(ros-indigo-rosservice
  ros-indigo-rospy-tutorials
  ros-indigo-geometry-msgs
  ros-indigo-message-runtime
  ros-indigo-rospy
  ros-indigo-std-srvs
  ros-indigo-rostopic
  ros-indigo-actionlib-msgs
  ros-indigo-stereo-msgs
  ros-indigo-sensor-msgs
  ros-indigo-nav-msgs)
depends=(${ros_depends[@]}
  python2-pillow)

_tag=release/indigo/rosbridge_library/${pkgver}-${_pkgver_patch}
_dir=rosbridge_library
source=("${_dir}"::"git+https://github.com/RobotWebTools-release/rosbridge_suite-release.git"#tag=${_tag})
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
