# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The ability to add gtest-based tests in the ament buildsystem in CMake."
url='http://www.ros.org/'

pkgname='ros-ardent-ament-cmake-gtest'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=(ros-ardent-ament-cmake-core)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-gtest-vendor
  ros-ardent-ament-cmake-test)
depends=(${ros_depends[@]}
  gtest)

# Git version (e.g. for debugging)
# _tag=release/ardent/ament_cmake_gtest/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/ament_cmake-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ament_cmake-release-release-ardent-ament_cmake_gtest-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/ament_cmake-release/archive/release/ardent/ament_cmake_gtest/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('2146efe1cdc0e9a20ab694f4bb8333cdb10c73e6547510a7a06c79ac7263eb01')

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
