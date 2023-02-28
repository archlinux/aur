# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Homalozoa <nx dot tardis at gmail dot com>

pkgname=ignition-msgs-5
pkgver=5.11.0
pkgrel=2
pkgdesc="Messages for Gazebo robot simulation."
arch=('i686' 'x86_64')
url="https://gazebosim.org/libs/msgs"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'ignition-math=6' 'ignition-utils'
'ignition-tools' 'python')
makedepends=('ignition-cmake=2' 'ruby-ronn' 'doxygen' 'tinyxml2')
provides=('ignition-msgs=5')
source=("${pkgname}-${pkgver}::https://github.com/gazebosim/gz-msgs/archive/ignition-msgs5_${pkgver}.tar.gz")
sha256sums=('3cf31cabd0d21fc9cb111aafedd65c13d5523a7585572e85657681baf1878da7')

_dir="gz-msgs-ignition-msgs5_${pkgver}"

build() {
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False
  make
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="${pkgdir}/" install
}
