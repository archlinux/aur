# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Filter which fuses angular velocities, accelerations, and (optionally) magnetic readings from a generic IMU device into an orientation."
url='http://ros.org/wiki/imu_filter_madgwick'

pkgname='ros-indigo-imu-filter-madgwick'
pkgver='1.0.9'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPL')

ros_makedepends=(ros-indigo-tf2-ros
  ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-catkin
  ros-indigo-pluginlib
  ros-indigo-sensor-msgs
  ros-indigo-dynamic-reconfigure
  ros-indigo-message-filters
  ros-indigo-tf2)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-tf2-ros
  ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-pluginlib
  ros-indigo-sensor-msgs
  ros-indigo-dynamic-reconfigure
  ros-indigo-message-filters
  ros-indigo-tf2)
depends=(${ros_depends[@]})

_tag=release/indigo/imu_filter_madgwick/${pkgver}-${_pkgver_patch}
_dir=imu_filter_madgwick
source=("${_dir}"::"git+https://github.com/uos-gbp/imu_tools-release.git"#tag=${_tag})
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
