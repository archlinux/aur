# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - turtlebot_calibration."
url='http://ros.org/wiki/turtlebot_calibration'

pkgname='ros-indigo-turtlebot-calibration'
pkgver='2.3.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-rospy
  ros-indigo-catkin
  ros-indigo-message-generation
  ros-indigo-python-orocos-kdl
  ros-indigo-sensor-msgs
  ros-indigo-nav-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-message-runtime
  ros-indigo-rospy
  ros-indigo-python-orocos-kdl
  ros-indigo-turtlebot-bringup
  ros-indigo-sensor-msgs
  ros-indigo-nav-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/turtlebot_calibration/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/turtlebot-release/turtlebot_apps-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="turtlebot_apps-release-release-indigo-turtlebot_calibration-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/turtlebot-release/turtlebot_apps-release/archive/release/indigo/turtlebot_calibration/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('6c78c3f8eb7067f65a91d792d7eb05cb9c5d5ae7e15693dfd3a7831811506a26')

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
