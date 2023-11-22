# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: Johannes Wienke <languitar@semipol.de>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
pkgname=ignition-transport
pkgver=13.0.0
pkgrel=1
pkgdesc="Transport library for component communication based on publication/subscription and service calls."
arch=('i686' 'x86_64')
url="https://gazebosim.org/libs/transport"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'zeromq' 'ignition-msgs>5' 'ignition-tools>1'
         'ignition-utils>1' 'libutil-linux' 'tinyxml2')
makedepends=('ignition-cmake>2' 'util-linux')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gazebosim/gz-transport/archive/gz-transport13_${pkgver}.tar.gz")
sha256sums=('8041d81693b69a94e36477178fdf1964f32725e520c33fec2e69c60f28fd84ca')

_dir="gz-transport-gz-transport13_${pkgver}"

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
