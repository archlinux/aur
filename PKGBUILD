# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Package a newer version of uncrustify (0.61+, b6593c1, April 14th 2015)."
url='https://github.com/bengardner/uncrustify'

pkgname='ros-ardent-uncrustify'
pkgver='0.61.20150413'
_pkgver_patch=7
arch=('any')
pkgrel=8
license=('GNU GENERAL PUBLIC LICENSE Version 3')

ros_makedepends=(ros-ardent-ament-cmake-core)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/uncrustify/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/uncrustify-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="uncrustify-release-release-ardent-uncrustify-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/uncrustify-release/archive/release/ardent/uncrustify/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('56b483a9f0a43ca316f6d81c306568e16366de85ed126871fea947c5977e61a7')

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
