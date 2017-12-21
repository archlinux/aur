# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - CMake shim over the poco library."
url='http://www.ros.org/'

pkgname='ros-ardent-poco-vendor'
pkgver='1.0.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0, Boost Software License 1.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]}
  zlib
  sqlite
  cmake
  pcre
  expat)

# Git version (e.g. for debugging)
# _tag=release/ardent/poco_vendor/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/poco_vendor-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="poco_vendor-release-release-ardent-poco_vendor-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/poco_vendor-release/archive/release/ardent/poco_vendor/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('2d21ebb3da262bf26239d1fde5cb0a53422a831fce7cb8a839b58d4f6879d68b')

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
