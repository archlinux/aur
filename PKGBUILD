# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-sensors
pkgver=7.1.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-sensors/archive/gz-sensors7_${pkgver}.tar.gz")
sha256sums=('b9b1aae94c20fa849015a203e9dbf4ed97e0152ae5f5c3de88cb4e44900ea6cd')

_dir="gz-sensors-gz-sensors7_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=OFF

  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="${pkgdir}/" install
}
