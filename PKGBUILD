# Maintainer: Harry Jeffery <me@harry.pm>

pkgname=libgrapheme
pkgver=1
pkgrel=1
pkgdesc="grapheme cluster utility library"
url="https://libs.suckless.org/libgrapheme/"
license=("ISC")
arch=("x86_64")
makedepends=("git")
conflicts=("libgrapheme")
source=("https://dl.suckless.org/libgrapheme/libgrapheme-${pkgver}.tar.gz")
sha256sums=("8622df5150ce941d5c4665d0e09a1d42c2c25f628a27f48ca1e669576162d0f6")

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's|/usr/local|/usr|' config.mk
}

build() {
  cd "${pkgname}-${pkgver}"
  make all
}

check() {
  cd "${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" make install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
