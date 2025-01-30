# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=Alikins
_name=Alikins-rack-plugins
pkgname=vcvrack-alikins
pkgver=2.0.0
pkgrel=2
pkgdesc='Alikins VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/alikins/Alikins-rack-plugins'
license=(GPL3)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alikins/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8e8f6e776205ecb11b268760b42e5eea08d92ac2c50f994abd732cfd92ecc877')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  # remove common license
  rm "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE.txt
}
