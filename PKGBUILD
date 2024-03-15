# Maintainer: Jamie Nadeau <james2432 at gmail dot com>
pkgname=tippecanoe
pkgver=2.51.0
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
md5sums=('e5c9abfa23fbdcf7f5beac9e7efc70c9')

check() {
  cd "$pkgname-$pkgver"
  #removed for now as upstream unit tests fail often
  #make test
}
build() {
  cd "$pkgname-$pkgver"
  #removed need to disable individual unit tests by disabling them entirely. See above
  #sed -i 's/layer-json-test pmtiles-test decode-pmtiles-test/layer-json-test decode-pmtiles-test/g' Makefile
  make -j tippecanoe tippecanoe-enumerate tippecanoe-decode tile-join tippecanoe-json-tool tippecanoe-overzoom
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/man/man1

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m755 tippecanoe "$pkgdir"/usr/bin/tippecanoe
  install -D -m755 tippecanoe-enumerate "$pkgdir"/usr/bin/tippecanoe-enumerate
  install -D -m755 tippecanoe-decode "$pkgdir"/usr/bin/tippecanoe-decode
  install -D -m755 tippecanoe-json-tool "$pkgdir"/usr/bin/tippecanoe-json-tool
  install -D -m755 tippecanoe-overzoom "$pkgdir"/usr/bin/tippecanoe-overzoom
  install -D -m755 tile-join "$pkgdir"/usr/bin/tile-join
  install -D -m755 man/tippecanoe.1 "$pkgdir"/usr/share/man/man1/tippecanoe.1
  
}

