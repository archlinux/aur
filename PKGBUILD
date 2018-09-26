# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Conversion functions between: - Eigen and KDL - Eigen and geometry_msgs."
url='http://ros.org/wiki/eigen_conversions'

pkgname='ros-melodic-eigen-conversions'
pkgver='1.12.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin
  ros-melodic-orocos-kdl
  ros-melodic-geometry-msgs
  ros-melodic-std-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-melodic-orocos-kdl
  ros-melodic-geometry-msgs
  ros-melodic-std-msgs)
depends=(${ros_depends[@]}
  eigen3)

# Git version (e.g. for debugging)
# _tag=release/melodic/eigen_conversions/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/geometry-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geometry-release-release-melodic-eigen_conversions-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/geometry-release/archive/release/melodic/eigen_conversions/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('6485f64dd54db8430e4aacfa15b0d09b575aff8cfcf4ad24f946e090004521ad')

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
