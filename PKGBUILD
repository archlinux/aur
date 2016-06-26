# Contributor: Mykola Dolhyi <0xb000@gmail.com>
pkgname=ignition-math
pkgver=2.4.0
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
sha256sums=('1fe4090a810180d1d32bda2e7afd1264982e7cba1dbe9891f72396c34991d870')

_dir="ignitionrobotics-ign-math-ac12fe30079e"

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
