# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - ROS nodelet for Kobuki: ROS wrapper for the Kobuki driver."
url='http://ros.org/wiki/kobuki_node'

pkgname='ros-indigo-kobuki-node'
pkgver='0.6.6'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-geometry-msgs
  ros-indigo-angles
  ros-indigo-nav-msgs
  ros-indigo-roscpp
  ros-indigo-std-msgs
  ros-indigo-kobuki-driver
  ros-indigo-diagnostic-msgs
  ros-indigo-kobuki-safety-controller
  ros-indigo-kobuki-keyop
  ros-indigo-ecl-streams
  ros-indigo-sensor-msgs
  ros-indigo-kobuki-ftdi
  ros-indigo-diagnostic-updater
  ros-indigo-ecl-threads
  ros-indigo-ecl-exceptions
  ros-indigo-rospy
  ros-indigo-ecl-sigslots
  ros-indigo-pluginlib
  ros-indigo-tf
  ros-indigo-nodelet
  ros-indigo-catkin
  ros-indigo-kobuki-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-capabilities
  ros-indigo-geometry-msgs
  ros-indigo-angles
  ros-indigo-diagnostic-aggregator
  ros-indigo-nav-msgs
  ros-indigo-roscpp
  ros-indigo-std-msgs
  ros-indigo-kobuki-driver
  ros-indigo-diagnostic-msgs
  ros-indigo-kobuki-rapps
  ros-indigo-kobuki-safety-controller
  ros-indigo-kobuki-keyop
  ros-indigo-ecl-streams
  ros-indigo-sensor-msgs
  ros-indigo-kobuki-ftdi
  ros-indigo-diagnostic-updater
  ros-indigo-ecl-threads
  ros-indigo-ecl-exceptions
  ros-indigo-rospy
  ros-indigo-ecl-sigslots
  ros-indigo-pluginlib
  ros-indigo-tf
  ros-indigo-nodelet
  ros-indigo-kobuki-msgs)
depends=(${ros_depends[@]})

_tag=release/indigo/kobuki_node/${pkgver}-${_pkgver_patch}
_dir=kobuki_node
source=("${_dir}"::"git+https://github.com/yujinrobot-release/kobuki-release.git"#tag=${_tag})
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
