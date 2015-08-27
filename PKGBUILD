# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Virtual sensor that uses semantic map information to see obstacles undetectable by robot sensors."
url='http://ros.org/wiki/yocs_virtual_sensor'

pkgname='ros-indigo-yocs-virtual-sensor'
pkgver='0.6.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-yocs-math-toolkit
  ros-indigo-catkin
  ros-indigo-yocs-msgs
  ros-indigo-sensor-msgs
  ros-indigo-tf)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-yocs-math-toolkit
  ros-indigo-rospy
  ros-indigo-rospy-message-converter
  ros-indigo-yocs-msgs
  ros-indigo-sensor-msgs
  ros-indigo-tf
  ros-indigo-visualization-msgs)
depends=(${ros_depends[@]})

_tag=release/indigo/yocs_virtual_sensor/${pkgver}-${_pkgver_patch}
_dir=yocs_virtual_sensor
source=("${_dir}"::"git+https://github.com/yujinrobot-release/yujin_ocs-release.git"#tag=${_tag})
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
