# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The entry point package for the ament buildsystem in CMake."
url='http://www.ros.org/'

pkgname='ros-ardent-ament-cmake'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-ament-cmake-export-include-directories
  ros-ardent-ament-cmake-export-libraries
  ros-ardent-ament-cmake-python
  ros-ardent-ament-cmake-libraries
  ros-ardent-ament-cmake-target-dependencies
  ros-ardent-ament-cmake-test
  ros-ardent-ament-cmake-export-dependencies
  ros-ardent-ament-cmake-export-interfaces
  ros-ardent-ament-cmake-export-definitions
  ros-ardent-ament-cmake-export-link-flags
  ros-ardent-ament-cmake-core)
depends=(${ros_depends[@]}
  cmake)

# Git version (e.g. for debugging)
# _tag=release/ardent/ament_cmake/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/ament_cmake-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ament_cmake-release-release-ardent-ament_cmake-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/ament_cmake-release/archive/release/ardent/ament_cmake/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('87d7a097ab6330b4f0f54eef9216437a7b54e7105477b8f8d539a1aee1626318')

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
