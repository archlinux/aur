# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Drivers for the Asus Xtion and Primesense Devices."
url='https://wiki.ros.org/openni2_camera'

pkgname='ros-noetic-openni2-camera'
pkgver='0.4.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-nodelet
  ros-noetic-roscpp
  ros-noetic-message-generation
  ros-noetic-camera-info-manager
  ros-noetic-dynamic-reconfigure
  ros-noetic-sensor-msgs
  ros-noetic-image-transport
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  openni2)

ros_depends=(ros-noetic-nodelet
  ros-noetic-roscpp
  ros-noetic-message-runtime
  ros-noetic-camera-info-manager
  ros-noetic-dynamic-reconfigure
  ros-noetic-sensor-msgs
  ros-noetic-image-transport)
depends=(${ros_depends[@]}
  openni2)

# Git version (e.g. for debugging)
# _tag=release/noetic/openni2_camera/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/openni2_camera-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="openni2_camera-${pkgver}/openni2_camera"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/openni2_camera/archive/${pkgver}.tar.gz")
sha256sums=('98df75bef6d8865eab33ebeaec6b3bd098ca249b18c0e0459221483d51b0d2ca')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
