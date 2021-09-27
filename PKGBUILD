# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-sensors
pkgver=5.0.0
pkgrel=1
pkgdesc="Provides numerous sensor models designed to generate realistic data
from simulation environments."
arch=('x86_64')
url="https://ignitionrobotics.org/libs/sensors"
license=('Apache')
depends=(
    ignition-transport
    ignition-rendering
    ignition-msgs
    ignition-plugin
    sdformat
)
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-sensors/archive/${pkgname}5_${pkgver}.tar.gz")
sha256sums=('2484b82d2122633956fdf3fab9e8a41fd8c18de3055d059ec461c9b9153c3257')

_dir="ign-sensors-${pkgname}5_${pkgver}"

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
