# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - libuvc_ros metapackage."
url='https://wiki.ros.org/libuvc_ros'

pkgname='ros-noetic-libuvc-ros'
pkgver='0.0.10'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-libuvc-camera)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/libuvc_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-drivers-gbp/libuvc_ros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="libuvc_ros-${pkgver}/libuvc_ros"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/libuvc_ros/archive/${pkgver}.tar.gz")
sha256sums=('33c356df370f548be1dbc1d21a13bf2704b6ea0218f77d3d6f305392266629d3')

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
