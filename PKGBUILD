# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=rumur
pkgver=2019.09.15
pkgrel=1
pkgdesc="Yet another Murphi model checker"
arch=('x86_64')
url="https://github.com/Smattr/rumur"
license=('custom:UNLICENSE')
depends=('gmp' 'python')
makedepends=('cmake' 'bison>=3.3.2' 'flex')
checkdepends=('valgrind')
source=("https://github.com/Smattr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8cd16fb6206db02f1d053a1c05012f49e2679ae5a448b8fa3c383c2be1568714')

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
  # The test needs about 1 hour
  #../tests/integration-tests.py --verbose
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
