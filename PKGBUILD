# Contributor: Mykola Dolhyi <0xb000@gmail.com>
pkgname=ignition-math
pkgver=2.3.0
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
source=("https://bitbucket.org/ignitionrobotics/ign-math/get/${pkgname}2_${pkgver}.tar.bz2")
sha256sums=('a1ef0fb00953846d00a64809c499a41e2dfff5b5c7fd0a646c9eebe6b54964d2')

_dir="ignitionrobotics-ign-math-f3919dfcf50e"

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
