# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Drivers for the Asus Xtion and Primesense Devices."
url='http://www.ros.org/'

pkgname='ros-kinetic-openni2-camera'
pkgver='0.2.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-nodelet
  ros-kinetic-roscpp
  ros-kinetic-message-generation
  ros-kinetic-camera-info-manager
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-sensor-msgs
  ros-kinetic-image-transport
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  openni2)

ros_depends=(ros-kinetic-nodelet
  ros-kinetic-roscpp
  ros-kinetic-message-runtime
  ros-kinetic-camera-info-manager
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-sensor-msgs
  ros-kinetic-image-transport)
depends=(${ros_depends[@]}
  openni2)

# Git version (e.g. for debugging)
# _tag=release/kinetic/openni2_camera/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/openni2_camera-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="openni2_camera-release-release-kinetic-openni2_camera-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/openni2_camera-release/archive/release/kinetic/openni2_camera/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('a56b7877cfc29e04b8e2f6729aabf160879a5612cc69a7a943c81d1a374bd2e3')

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
