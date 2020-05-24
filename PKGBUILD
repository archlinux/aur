# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - ROS messages for Geographic Information Systems."
url='https://wiki.ros.org/geographic_msgs'

pkgname='ros-noetic-geographic-msgs'
pkgver='0.5.3'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-catkin
  ros-noetic-message-generation
  ros-noetic-geometry-msgs
  ros-noetic-uuid-msgs
  ros-noetic-std-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-message-runtime
  ros-noetic-geometry-msgs
  ros-noetic-uuid-msgs
  ros-noetic-std-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/geographic_msgs/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-geographic-info/geographic_info-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geographic_info-geographic_info-${pkgver}/geographic_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-geographic-info/geographic_info/archive/geographic_info-${pkgver}.tar.gz")
sha256sums=('2a2de063b17dc00c20bd49d59ded6934081fc22d8749dc8542d407d1ca0e608e')

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
