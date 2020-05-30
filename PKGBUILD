# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - octovis is visualization tool for the OctoMap library based on Qt and libQGLViewer."
url='https://octomap.github.io'

pkgname='ros-noetic-octovis'
pkgver='1.9.0'
arch=('any')
pkgrel=4
license=('GPLv2')

ros_makedepends=(ros-noetic-octomap)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt4
  libqglviewer-qt4)

ros_depends=(ros-noetic-catkin
  ros-noetic-octomap)
depends=(${ros_depends[@]}
  qt4
  libqglviewer-qt4)

_dir="octomap-${pkgver}/octovis"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OctoMap/octomap/archive/v${pkgver}.tar.gz")
sha256sums=('5f81c9a8cbc9526b2e725251cd3a829e5222a28201b394314002146d8b9214dd')

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
