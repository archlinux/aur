# Maintainer: Ciappi <marco.scopesi@gmail.com>
pkgname=lfortran
pkgver=0.17.0
pkgrel=1
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
sha256sums=('44030e27d1c1f85d6c367c0fa901e7ad753e8ca04bbb58cef16b8101085b6f53')
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

