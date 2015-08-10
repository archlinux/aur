# Contributor: Mykola Dolhyi <0xb000@gmail.com>
pkgname=ignition-math
pkgver=1.0.0
pkgrel=1
pkgdesc="Math classes and functions for robot applications"
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org/"
license=('Apache')
groups=('development')
depends=()
makedepends=('cmake' 'ruby-ronn' 'pkg-config>=0.28')
optdepends=()
provides=('ignition-math2')
conflicts=()
replaces=('ignition-math2')
#changelog=
source=("http://gazebosim.org/distributions/ign-math/releases/$pkgname-$pkgver.tar.bz2")
#noextract=()
sha256sums=('5c15bbafdab35d1e0b2f9e43ea13fc665e29c19530c94c89b92a86491128b30a')
#validpgpkeys=()

_dir="$pkgname-$pkgver"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DENABLE_TESTS_COMPILATION:BOOL=False

  # Compile
  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
