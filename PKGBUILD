# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains a C++ parser for the Collada robot description format."
url='http://ros.org/wiki/collada_parser'

pkgname='ros-indigo-collada-parser'
pkgver='1.11.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-urdf-parser-plugin
  ros-indigo-catkin
  ros-indigo-urdfdom-headers
  ros-indigo-roscpp
  ros-indigo-class-loader)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  collada-dom)

ros_depends=(ros-indigo-urdf-parser-plugin
  ros-indigo-urdfdom-headers
  ros-indigo-roscpp
  ros-indigo-class-loader)
depends=(${ros_depends[@]}
  collada-dom)

_tag=release/indigo/collada_parser/${pkgver}-${_pkgver_patch}
_dir=collada_parser
source=("${_dir}"::"git+https://github.com/ros-gbp/robot_model-release.git"#tag=${_tag})
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
