# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - depthimage_to_laserscan."
url='http://ros.org/wiki/depthimage_to_laserscan'

pkgname='ros-ardent-depthimage-to-laserscan'
pkgver='2.0.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-ardent-ament-cmake-ros)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-sensor-msgs
  ros-ardent-rclcpp
  ros-ardent-image-geometry)
depends=(${ros_depends[@]}
  opencv)

# Git version (e.g. for debugging)
# _tag=release/ardent/depthimage_to_laserscan/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/depthimage_to_laserscan-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="depthimage_to_laserscan-release-release-ardent-depthimage_to_laserscan-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/depthimage_to_laserscan-release/archive/release/ardent/depthimage_to_laserscan/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('7ff447964a47276d69e84bac034d847394912686cf040fe78ba4247dc70041ed')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/ardent/setup.bash ] && source /opt/ros/ardent/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 "${srcdir}/${_dir}"

  export PYTHONPATH=/opt/ros/ardent/lib/python3.6/site-packages
  export AMENT_PREFIX_PATH=/opt/ros/ardent

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=Off \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/ardent
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
