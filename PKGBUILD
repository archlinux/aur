# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - octomap_ros provides conversion functions between ROS and OctoMaps native types."
url='http://ros.org/wiki/octomap_ros'

pkgname='ros-noetic-octomap-ros'
pkgver='0.4.1'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
  ros-noetic-octomap
  ros-noetic-sensor-msgs
  ros-noetic-octomap-msgs
  ros-noetic-tf
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(
  ros-noetic-octomap
  ros-noetic-tf
  ros-noetic-octomap-msgs
  ros-noetic-sensor-msgs)
depends=(${ros_depends[@]})

_dir="octomap_ros-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OctoMap/octomap_ros/archive/${pkgver}.tar.gz")
sha256sums=('188d1623eb02b777f1873d1a69791f20989a2f34dcbd0e9a205399faa5ab7cb2')

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
