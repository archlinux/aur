# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Converts a 3D Point Cloud into a 2D laser scan."
url='http://ros.org/wiki/perception_pcl'

pkgname='ros-jade-pointcloud-to-laserscan'
pkgver='1.3.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-tf2-sensor-msgs
  ros-jade-sensor-msgs
  ros-jade-nodelet
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-tf2-ros
  ros-jade-tf2
  ros-jade-message-filters)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-tf2-sensor-msgs
  ros-jade-sensor-msgs
  ros-jade-nodelet
  ros-jade-roscpp
  ros-jade-tf2-ros
  ros-jade-tf2
  ros-jade-message-filters)
depends=(${ros_depends[@]})

_tag=release/jade/pointcloud_to_laserscan/${pkgver}-${_pkgver_patch}
_dir=pointcloud_to_laserscan
source=("${_dir}"::"git+https://github.com/ros-gbp/pointcloud_to_laserscan-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
