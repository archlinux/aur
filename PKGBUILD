# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - C++ implementation of bond, a mechanism for checking when another process has terminated."
url='http://www.ros.org/wiki/bondcpp'

pkgname='ros-indigo-bondcpp'
pkgver='1.7.16'
_pkgver_patch=0
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-indigo-bond
  ros-indigo-cmake-modules
  ros-indigo-catkin
  ros-indigo-roscpp
  ros-indigo-smclib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  util-linux
  boost)

ros_depends=(ros-indigo-bond
  ros-indigo-smclib
  ros-indigo-roscpp)
depends=(${ros_depends[@]}
  util-linux
  boost)

_tag=release/indigo/bondcpp/${pkgver}-${_pkgver_patch}
_dir=bondcpp
source=("${_dir}"::"git+https://github.com/ros-gbp/bond_core-release.git"#tag=${_tag})
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
