# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Small lib to transform sensor_msgs with tf."
url='http://www.ros.org/wiki/tf2_ros'

pkgname='ros-indigo-tf2-sensor-msgs'
pkgver='0.5.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-cmake-modules
  ros-indigo-catkin
  ros-indigo-tf2-ros
  ros-indigo-tf2
  ros-indigo-sensor-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-indigo-cmake-modules
  ros-indigo-tf2-ros
  ros-indigo-tf2
  ros-indigo-sensor-msgs)
depends=(${ros_depends[@]}
  eigen3)

_tag=release/indigo/tf2_sensor_msgs/${pkgver}-${_pkgver_patch}
_dir=tf2_sensor_msgs
source=("${_dir}"::"git+https://github.com/ros-gbp/geometry_experimental-release.git"#tag=${_tag})
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
