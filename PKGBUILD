# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This library provides a standardized interface for processing data as a sequence of filters."
url='http://ros.org/wiki/filters'

pkgname='ros-jade-filters'
pkgver='1.7.4'
_pkgver_patch=3
arch=('any')
pkgrel=4
license=('BSD')

ros_makedepends=(ros-jade-roslib
  ros-jade-rostest
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-rosconsole
  ros-jade-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-rosconsole
  ros-jade-pluginlib
  ros-jade-roslib
  ros-jade-roscpp)
depends=(${ros_depends[@]})

_tag=release/jade/filters/${pkgver}-${_pkgver_patch}
_dir=filters
source=("${_dir}"::"git+https://github.com/ros-gbp/filters-release.git"#tag=${_tag})
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
