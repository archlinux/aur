# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package provides a set of typedefs that allow using Eigen datatypes in STL containers."
url='http://eigen.tuxfamily.org/dox/TopicUnalignedArrayAssert.html'

pkgname='ros-noetic-eigen-stl-containers'
pkgver='0.1.8'
arch=('any')
pkgrel=4
license=('BSD')

ros_makedepends=(ros-noetic-catkin
  ros-noetic-cmake-modules)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen)

ros_depends=()
depends=(${ros_depends[@]}
  eigen)

_dir="eigen_stl_containers-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/eigen_stl_containers/archive/${pkgver}.tar.gz")
sha256sums=('cf1bcd3253aff0eb032f6d74b9b3c322c99f75ee66bd7034daee8bb2d2a422fc')

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
