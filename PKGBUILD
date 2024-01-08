# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=blis
pkgver=0.9.0
pkgrel=3
pkgdesc="BLAS-like Library Instantiation Software Framework"
arch=('i686' 'x86_64')
url="https://github.com/flame/blis"
license=('custom')
depends=('gcc-libs')
makedepends=('python')
provides=('blas' 'cblas')
conflicts=('blas' 'cblas')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/flame/blis/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1135f664be7355427b91025075562805cdc6cc730d3173f83533b2c5dcc2f308')


build() {
  cd "$pkgname-$pkgver"

  ./configure \
    --prefix="/usr" \
    --enable-cblas \
    --enable-threading=openmp auto
  make
}

check() {
  cd "$pkgname-$pkgver"

  #make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/blis"
}
