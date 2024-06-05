# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=blis
pkgver=1.0
pkgrel=2
pkgdesc="BLAS-like Library Instantiation Software Framework"
arch=('i686' 'x86_64')
url="https://github.com/flame/blis"
license=('BSD-3-Clause')
depends=('gcc-libs')
makedepends=('python')
provides=('blas' 'cblas')
conflicts=('blas' 'cblas')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/flame/blis/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9c12972aa1e50f64ca61684eba6828f2f3dd509384b1e41a1e8a9aedea4b16a6')


build() {
  cd "$pkgname-$pkgver"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
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
