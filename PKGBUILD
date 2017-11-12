# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available."
url='http://ros.org/wiki/qt_gui_cpp'

pkgname='ros-lunar-qt-gui-cpp'
pkgver='0.3.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin
  ros-lunar-cmake-modules
  ros-lunar-python-qt-binding)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt5-base
  pkg-config)

ros_depends=(ros-lunar-qt-gui
  ros-lunar-pluginlib)
depends=(${ros_depends[@]}
  tinyxml)

ros_checkdepends=()
checkdepends=(${ros_checkdepends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/qt_gui_cpp/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/qt_gui_core-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="qt_gui_core-release-release-lunar-qt_gui_cpp-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/qt_gui_core-release/archive/release/lunar/qt_gui_cpp/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('7df42ace865c6694eb6bb110a5316f268877edba201aa46c3d3372f61527298f')

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
