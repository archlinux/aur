# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The libg2o library from http://openslam.org/g2o.html."
url='https://github.com/RainerKuemmerle/g2o'

pkgname='ros-lunar-libg2o'
pkgver='2017.4.2'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=()
makedepends=(${ros_makedepends[@]}
  cmake
  ros-build-tools)

ros_depends=(ros-lunar-catkin)
depends=(${ros_depends[@]}
  mesa
  boost
  eigen3
  suitesparse)

# Git version (e.g. for debugging)
# _tag=release/lunar/libg2o/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/libg2o-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="libg2o-release-release-lunar-libg2o-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/libg2o-release/archive/release/lunar/libg2o/${pkgver}-${_pkgver_patch}.tar.gz" )
sha256sums=('9364f946e8412b3f6b45b91bfd05563616ee6fc37fb22e8c31970495f0e108ce' )



build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 "${srcdir}/${_dir}"

  export PYTHONPATH=/opt/ros/lunar/lib/python3.6/site-packages

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=Off \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
