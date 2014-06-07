# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package defines messages commonly used in mapping packages."
url='http://ros.org/wiki/map_msgs'

pkgname='ros-indigo-map-msgs'
pkgver='0.0.2'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-indigo-message-generation
  ros-indigo-catkin
  ros-indigo-sensor-msgs
  ros-indigo-nav-msgs
  ros-indigo-std-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-std-msgs
  ros-indigo-message-runtime
  ros-indigo-nav-msgs
  ros-indigo-sensor-msgs)
depends=(${ros_depends[@]})

_tag=release/indigo/map_msgs/${pkgver}-${_pkgver_patch}
_dir=map_msgs
source=("${_dir}"::"git+https://github.com/ros-gbp/map_msgs-release.git"#tag=${_tag})
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
