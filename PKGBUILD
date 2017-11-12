# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - qt_gui_py_common provides common functionality for GUI plugins written in Python."
url='http://ros.org/wiki/qt_gui_py_common'

pkgname='ros-lunar-qt-gui-py-common'
pkgver='0.3.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-lunar-python-qt-binding)
depends=(${ros_depends[@]}
  python2-rospkg)

ros_checkdepends=()
checkdepends=(${ros_checkdepends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/qt_gui_py_common/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/qt_gui_core-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="qt_gui_core-release-release-lunar-qt_gui_py_common-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/qt_gui_core-release/archive/release/lunar/qt_gui_py_common/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('7b7ffdda54e8ec3f7868ed19d190f7a54306a88660a034f5885d9bb35f3cb892')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 "${srcdir}/${_dir}"

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCATKIN_ENABLE_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
