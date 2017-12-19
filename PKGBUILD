# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - 3D visualization tool for ROS."
url='http://ros.org/wiki/rviz2'

pkgname='ros-ardent-rviz2'
pkgver='2.0.0'
_pkgver_patch=5
arch=('any')
pkgrel=6
license=('BSD')

ros_makedepends=(ros-ardent-ament-cmake)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt5-base)

ros_depends=(ros-ardent-rviz-ogre-vendor
  ros-ardent-rviz-common)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/rviz2/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/rviz-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rviz-release-release-ardent-rviz2-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/rviz-release/archive/release/ardent/rviz2/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('370c4cfcda241dd3c365654e5fff0022cabf44bfb50c33aad84d70fd0f8c9e57')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/ardent/setup.bash ] && source /opt/ros/ardent/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 "${srcdir}/${_dir}"

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/ardent \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.5m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.5m.so \
        -DPYTHON_BASENAME=.cpython-35m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCATKIN_ENABLE_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
