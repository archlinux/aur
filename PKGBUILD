# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: Johannes Wienke <languitar@semipol.de>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
pkgname=ignition-transport
pkgver=12.1.0
pkgrel=2
pkgdesc="Transport library for component communication based on publication/subscription and service calls."
arch=('i686' 'x86_64')
url="https://gazebosim.org/libs/transport"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'zeromq' 'ignition-msgs>5' 'ignition-tools>1'
         'ignition-utils>1' 'libutil-linux' 'tinyxml2')
makedepends=('ignition-cmake>2' 'util-linux')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gazebosim/gz-transport/archive/gz-transport12_${pkgver}.tar.gz")
sha256sums=('b6bd46bf1ae73e8f49f298d754638ae75e877bc582e64cf8e5aad5f83135f989')

_dir="gz-transport-gz-transport12_${pkgver}"

build() {
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=Off
  make
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="${pkgdir}/" install
}
