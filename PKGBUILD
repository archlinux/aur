# Maintainer: Ciappi <marco.scopesi@gmail.com>
pkgname=lfortran
pkgver=0.14.0
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
sha256sums=('fc3c1d592c56ae2636065ec0228db747f154f65a0867f6311bc8091efd5c13a7')
noextract=()

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
