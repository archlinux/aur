# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - USB Video Class camera driver."
url='https://wiki.ros.org/libuvc_camera'

pkgname='ros-noetic-libuvc-camera'
pkgver='0.0.10'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-noetic-camera-info-manager
  ros-noetic-nodelet
  ros-noetic-roscpp
  ros-noetic-libuvc
  ros-noetic-dynamic-reconfigure
  ros-noetic-sensor-msgs
  ros-noetic-image-transport
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-camera-info-manager
  ros-noetic-nodelet
  ros-noetic-roscpp
  ros-noetic-libuvc
  ros-noetic-dynamic-reconfigure
  ros-noetic-sensor-msgs
  ros-noetic-image-transport)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/libuvc_camera/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-drivers-gbp/libuvc_ros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="libuvc_ros-${pkgver}/libuvc_camera"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/libuvc_ros/archive/${pkgver}.tar.gz")
sha256sums=('33c356df370f548be1dbc1d21a13bf2704b6ea0218f77d3d6f305392266629d3')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  grep -Rl "env python2" ${srcdir}/${_dir} | xargs -r -n 1 -- sed -i 's/env python2/env python/'

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
