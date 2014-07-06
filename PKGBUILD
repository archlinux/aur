# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains the ROS bindings for the tf2 library, for both Python and C++."
url='http://www.ros.org/wiki/tf2_ros'

pkgname='ros-indigo-tf2-ros'
pkgver='0.5.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-rosgraph
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-rospy
  ros-indigo-tf2-py
  ros-indigo-tf2-msgs
  ros-indigo-actionlib
  ros-indigo-actionlib-msgs
  ros-indigo-catkin
  ros-indigo-message-filters
  ros-indigo-tf2)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-rosgraph
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-rospy
  ros-indigo-tf2-py
  ros-indigo-tf2-msgs
  ros-indigo-actionlib
  ros-indigo-actionlib-msgs
  ros-indigo-message-filters
  ros-indigo-tf2)
depends=(${ros_depends[@]})

_tag=release/indigo/tf2_ros/${pkgver}-${_pkgver_patch}
_dir=tf2_ros
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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
