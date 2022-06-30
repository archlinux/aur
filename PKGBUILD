# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-sensors
pkgver=6.6.0
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
sha256sums=('3f1ed7159f299506614fd566eb0688c4858270720008848cac5faf14e9c2c809')

_dir="gz-sensors-${pkgname}6_${pkgver}"

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
