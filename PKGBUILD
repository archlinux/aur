# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rqt_multiplot provides a GUI plugin for visualizing numeric values in multiple 2D plots using the Qwt plotting backend."
url='http://www.ros.org/'

pkgname='ros-kinetic-rqt-multiplot'
pkgver='0.0.10'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('GNU Lesser General Public License (LGPL)')

ros_makedepends=(ros-kinetic-variant-topic-tools
  ros-kinetic-rqt-gui
  ros-kinetic-rqt-gui-cpp
  ros-kinetic-roscpp
  ros-kinetic-rosbag
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qwt
  qt5-base)

ros_depends=(ros-kinetic-rqt-gui
  ros-kinetic-roscpp
  ros-kinetic-rosbag
  ros-kinetic-rqt-gui-cpp
  ros-kinetic-variant-topic-tools)
depends=(${ros_depends[@]}
  qwt
  qt5-base)

# Git version (e.g. for debugging)
# _tag=release/kinetic/rqt_multiplot/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/anybotics/rqt_multiplot_plugin-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_multiplot_plugin-release-release-kinetic-rqt_multiplot-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/anybotics/rqt_multiplot_plugin-release/archive/release/kinetic/rqt_multiplot/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('8609de1db057f16d19ba9097a5022e0551f29f20b4e185a154e5fa2b09c3de0e')

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
