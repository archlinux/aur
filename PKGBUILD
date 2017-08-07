# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Transmission Interface."
url='https://github.com/ros-controls/ros_control/wiki'

pkgname='ros-lunar-transmission-interface'
pkgver='0.12.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Modified BSD')

ros_makedepends=(ros-lunar-catkin
  ros-lunar-cmake-modules
  ros-lunar-roscpp
  ros-lunar-pluginlib
  ros-lunar-hardware-interface)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  tinyxml)

ros_depends=(ros-lunar-roscpp
  ros-lunar-pluginlib)
depends=(${ros_depends[@]}
  tinyxml)

# Git version (e.g. for debugging)
# _tag=release/lunar/transmission_interface/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_control-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_control-release-release-lunar-transmission_interface-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_control-release/archive/release/lunar/transmission_interface/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('c3799c0452099ed0fec3f8ee4977666a001e004e72a597b04f49976040623e43')

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
