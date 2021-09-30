# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Mykola Dolhyi <0xb000@gmail.com>
# Contributor: Ramdambo <https://github.com/Ramdambo>
pkgname=ignition-math
pkgver=6.9.0
pkgrel=1
pkgdesc="Math classes and functions for robot applications"
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/math"
license=('Apache')
groups=('development')
depends=('gcc-libs')
makedepends=('ignition-cmake>=2')
optdepends=('eigen')
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-math/archive/${pkgname}6_${pkgver}.tar.gz")
sha256sums=('80b7788c02df5a28333780d1049d5a84059fd969365cefd5476021c355916b3b')

_dir="ign-math-${pkgname}6_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  cmake .. -Wno-dev \
           -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False

  make
}


package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
