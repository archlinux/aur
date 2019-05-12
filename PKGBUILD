# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=rumur
pkgver=2019.05.11
pkgrel=1
pkgdesc="Yet another Murphi model checker"
arch=('x86_64')
url="https://github.com/Smattr/rumur"
license=('custom:UNLICENSE')
depends=('gmp')
makedepends=('cmake' 'bison>=3.3.2' 'flex' 'python')
source=("https://github.com/Smattr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('188a6667dbdda017eb6cd251845cef1ea0f8e37f3b74ecae0e475ffdcef7df82')

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
