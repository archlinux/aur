# Maintainer: Jamie Nadeau <james2432 at gmail dot com>
pkgname=tippecanoe
pkgver=2.32.1
pkgrel=1
pkgdesc="Builds vector tilesets from large (or small) collections of GeoJSON features"
arch=('i686' 'x86_64')
url="https://github.com/felt/tippecanoe/"
license=('BSD')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=(perl)
provides=('tippecanoe')
backup=()
options=()
install=''
source=("https://github.com/felt/tippecanoe/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('a37ac9623d405687d31abc79d5a60772')

check() {
  cd "$pkgname-$pkgver"
  make test
}
build() {
  cd "$pkgname-$pkgver"
  sed -i 's/layer-json-test pmtiles-test decode-pmtiles-test/layer-json-test decode-pmtiles-test/g' Makefile
  make tippecanoe tippecanoe-enumerate tippecanoe-decode tile-join tippecanoe-json-tool tippecanoe-overzoom
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/man/man1

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cp tippecanoe "$pkgdir"/usr/bin/tippecanoe
  cp tippecanoe-enumerate "$pkgdir"/usr/bin/tippecanoe-enumerate
  cp tippecanoe-decode "$pkgdir"/usr/bin/tippecanoe-decode
  cp tippecanoe-json-tool "$pkgdir"/usr/bin/tippecanoe-json-tool
  cp tippecanoe-overzoom "$pkgdir"/usr/bin/tippecanoe-overzoom
  cp tile-join "$pkgdir"/usr/bin/tile-join
  cp man/tippecanoe.1 "$pkgdir"/usr/share/man/man1/tippecanoe.1
  
}

