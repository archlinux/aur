# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The ros frontend to the pano subsystem."
url='http://ros.org/wiki/pano_ros'

pkgname='ros-indigo-pano-ros'
pkgver='2.3.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-image-transport
  ros-indigo-std-msgs
  ros-indigo-cv-bridge
  ros-indigo-rospy
  ros-indigo-catkin
  ros-indigo-message-generation
  ros-indigo-pano-py
  ros-indigo-actionlib-msgs
  ros-indigo-sensor-msgs
  ros-indigo-actionlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-std-msgs
  ros-indigo-message-runtime
  ros-indigo-rospy
  ros-indigo-image-transport
  ros-indigo-pano-py
  ros-indigo-actionlib-msgs
  ros-indigo-sensor-msgs
  ros-indigo-actionlib)
depends=(${ros_depends[@]})

_tag=release/indigo/pano_ros/${pkgver}-${_pkgver_patch}
_dir=pano_ros
source=("${_dir}"::"git+https://github.com/turtlebot-release/turtlebot_apps-release.git"#tag=${_tag})
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
