# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Drivers for the Microsoft Kinect, Asus Xtion, and Primesense Devices."
url='http://www.ros.org/'

pkgname='ros-melodic-openni-camera'
pkgver='1.11.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-nodelet
  ros-melodic-roscpp
  ros-melodic-camera-info-manager
  ros-melodic-dynamic-reconfigure
  ros-melodic-sensor-msgs
  ros-melodic-image-transport
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  openni)

ros_depends=(ros-melodic-nodelet
  ros-melodic-roscpp
  ros-melodic-message-runtime
  ros-melodic-camera-info-manager
  ros-melodic-dynamic-reconfigure
  ros-melodic-sensor-msgs
  ros-melodic-image-transport)
depends=(${ros_depends[@]}
  openni)

# Git version (e.g. for debugging)
# _tag=release/melodic/openni_camera/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/openni_camera-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="openni_camera-release-release-kinetic-openni_camera-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/openni_camera-release/archive/release/kinetic/openni_camera/1.11.0-0.tar.gz")
sha256sums=('b10cfd5d55e71c8f6f3837f8bea149ba58acc580a42a0f15dc7a1277b00a5438')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=.cpython-37m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
