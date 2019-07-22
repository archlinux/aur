# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=rumur
pkgver=2019.07.21
pkgrel=1
pkgdesc="Yet another Murphi model checker"
arch=('x86_64')
url="https://github.com/Smattr/rumur"
license=('custom:UNLICENSE')
depends=('gmp' 'python')
makedepends=('cmake' 'bison>=3.3.2' 'flex')
checkdepends=('valgrind')
source=("https://github.com/Smattr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e702f37bfd76f23409b67d8b5a161a48530f4bee1d58185745329d934859fe8e')

prepare() {
  mkdir -p $pkgname-$pkgver/build
}

build() {
  cd $pkgname-$pkgver/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

check() {
  cd $pkgname-$pkgver/build
  ../tests/integration-tests.py --verbose
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
