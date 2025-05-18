# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=blis
pkgver=1.1
pkgrel=2
pkgdesc="BLAS-like Library Instantiation Software Framework"
arch=('i686' 'x86_64')
url="https://github.com/flame/blis"
license=('BSD-3-Clause')
depends=('gcc-libs')
makedepends=('python')
provides=('libblis.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/flame/blis/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('847c035809b8994c077ade737a4813601db96c4cf0d903d08ba6a9b8ee0fe03e')


build() {
  cd "$pkgname-$pkgver"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --enable-cblas \
    --enable-threading=openmp \
    generic
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
