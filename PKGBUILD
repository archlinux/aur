# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A package containing builtin message and service definitions."
url='http://www.ros.org/'

pkgname='ros-ardent-builtin-interfaces'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=(ros-ardent-rosidl-default-generators
  ros-ardent-ament-cmake)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-rosidl-default-runtime)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/builtin_interfaces/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/rcl_interfaces-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rcl_interfaces-release-release-ardent-builtin_interfaces-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/rcl_interfaces-release/archive/release/ardent/builtin_interfaces/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('06884b7dc7a7b3f183a8838c0c762230a8e203e809f1822a035ee11fcd2cc9cd')

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
