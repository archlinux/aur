# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Persistent storage of ROS messages."
url='https://wiki.ros.org/warehouse_ros'

pkgname='ros-noetic-warehouse-ros'
pkgver='0.9.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-noetic-tf
  ros-noetic-std-msgs
  ros-noetic-roscpp
  ros-noetic-catkin
  ros-noetic-pluginlib
  ros-noetic-geometry-msgs
  ros-noetic-rostime)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-tf
  ros-noetic-std-msgs
  ros-noetic-roscpp
  ros-noetic-pluginlib
  ros-noetic-geometry-msgs
  ros-noetic-rostime)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/noetic/warehouse_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/warehouse_ros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="warehouse_ros-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/warehouse_ros/archive/${pkgver}.tar.gz")
sha256sums=('11782f721259698c4bfcbe99957687c827b92850866b42fb931cf9d134c34a7e')

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
