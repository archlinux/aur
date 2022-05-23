# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-sensors
pkgver=6.4.0
pkgrel=1
pkgdesc="Provides numerous sensor models designed to generate realistic data
from simulation environments."
arch=('x86_64')
url="https://gazebosim.org/libs/sensors"
license=('Apache')
depends=(
    ignition-transport
    ignition-rendering
    ignition-msgs
    ignition-plugin
    sdformat
)
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-sensors/archive/${pkgname}6_${pkgver}.tar.gz")
sha256sums=('e4210f59d4d49b89f178b7e42d5550b2a56d715a33e70168f4804009e5d0bd26')

_dir="gz-sensors-${pkgname}6_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=OFF

  # Compile
  make
}

package() {
  cd "$srcdir/$_dir/build"
  #make DESTDIR="$pkgdir/" install
  make install
}
