# Maintainer: Ciappi <marco.scopesi@gmail.com>
pkgname=lfortran
pkgver=0.15.0
pkgrel=2
pkgdesc="Modern interactive LLVM-based Fortran compiler"
arch=('x86_64')
url="https://lfortran.org"
license=('BSD')
groups=()
depends=("zlib" "ncurses")
makedepends=("llvm11" "cmake")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://lfortran.github.io/tarballs/release/"$pkgname-$pkgver.tar.gz)
sha256sums=('8712c1b0c886f08937ff4c277ff3fa5c05e4dead1bafe55e3bd789be96470127')
noextract=()

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DWITH_LLVM=yes -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make -k test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# vim:set ts=2 sw=2 et:

