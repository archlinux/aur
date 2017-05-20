# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rqt_rviz provides a GUI plugin embedding RViz."
url='http://wiki.ros.org/rqt_rviz'

pkgname='ros-lunar-rqt-rviz'
pkgver='0.5.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-rqt-gui-cpp
  ros-lunar-catkin
  ros-lunar-pluginlib
  ros-lunar-rqt-gui
  ros-lunar-rviz)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  qt5-base)

ros_depends=(ros-lunar-rqt-gui-cpp
  ros-lunar-pluginlib
  ros-lunar-rqt-gui
  ros-lunar-rviz)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/lunar/rqt_rviz/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_rviz-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_rviz-release-release-lunar-rqt_rviz-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_rviz-release/archive/release/lunar/rqt_rviz/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('30fbc521c4dee52883b4524545ccc6bf05d723bafab6dde434725644a1028a42')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
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
