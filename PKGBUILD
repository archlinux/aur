# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A metapackage to aggregate several packages."
url='https://github.com/ros/metapackages'

pkgname='ros-noetic-perception'
pkgver='1.4.1'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-vision-opencv
  ros-noetic-ros-base
  ros-noetic-perception-pcl
  ros-noetic-laser-pipeline
  ros-noetic-image-transport-plugins
  ros-noetic-image-pipeline
  ros-noetic-image-common)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/perception/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/metapackages-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="metapackages-${pkgver}/perception"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/metapackages/archive/${pkgver}.tar.gz")
sha256sums=('ef1df96c61c9762555174cc1a0e21e05149f74909d27044be0cd10aa065747a1')

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
