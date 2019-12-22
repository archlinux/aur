# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=libmcl
pkgver=1.03
pkgrel=1
pkgdesc='A portable and fast pairing-based cryptography library'
arch=('x86_64')
url='https://github.com/herumi/mcl'
license=('BSD')
makedepends=('cmake')
depends=('gmp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/herumi/mcl/archive/v$pkgver.tar.gz")
sha256sums=('dc935c6aa41b7e2d53965ecf6ac985237775c3d09a37d7d8417f0d46607a8ed5')

build() {
  cd "mcl-$pkgver"

  mkdir -p build
  env -C build cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make -C build
}

package() {
  cd "mcl-$pkgver"

  make -C build DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
