# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A library to access URDFs using the DOM model."
url='http://wiki.ros.org/urdf'

pkgname='ros-indigo-urdfdom-py'
pkgver='0.3.0'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-catkin_pkg
  python2)

ros_depends=(ros-indigo-catkin)
depends=(${ros_depends[@]}
  python2)

_tag=release/indigo/urdfdom_py/${pkgver}-${_pkgver_patch}
_dir=urdfdom_py
source=("${_dir}"::"git+https://github.com/ros-gbp/urdfdom_py-release.git"#tag=${_tag})
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
