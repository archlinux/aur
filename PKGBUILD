# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This stack provides Python bindings for Qt."
url='http://ros.org/wiki/python_qt_binding'

pkgname='ros-kinetic-python-qt-binding'
pkgver='0.3.1'
_pkgver_patch=2
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-kinetic-catkin
  ros-kinetic-rosbuild)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-pyqt5
  qt5-base)

ros_depends=()
depends=(${ros_depends[@]}
  python2-pyqt5)

# Git version (e.g. for debugging)
# _tag=release/kinetic/python_qt_binding/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/python_qt_binding-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="python_qt_binding-release-release-kinetic-python_qt_binding-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/python_qt_binding-release/archive/release/kinetic/python_qt_binding/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('b39892ba9b38e7f6929156dfdba75a4eb14b87761bd2c6c1de0c0213b66f2841')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
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
