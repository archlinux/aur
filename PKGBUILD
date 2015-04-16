# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - tf is a package that lets the user keep track of multiple coordinate frames over time."
url='http://www.ros.org/wiki/tf'

pkgname='ros-indigo-tf'
pkgver='1.11.6'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-tf2-ros
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-rostest
  ros-indigo-angles
  ros-indigo-catkin
  ros-indigo-message-generation
  ros-indigo-rosconsole
  ros-indigo-sensor-msgs
  ros-indigo-message-filters
  ros-indigo-tf2)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-tf2-ros
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-roswtf
  ros-indigo-std-msgs
  ros-indigo-message-runtime
  ros-indigo-rosconsole
  ros-indigo-sensor-msgs
  ros-indigo-message-filters
  ros-indigo-tf2)
depends=(${ros_depends[@]}
  graphviz)

_tag=release/indigo/tf/${pkgver}-${_pkgver_patch}
_dir=tf
source=("${_dir}"::"git+https://github.com/ros-gbp/geometry-release.git"#tag=${_tag})
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
