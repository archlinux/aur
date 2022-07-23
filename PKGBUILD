# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=cvly
_name=cvly-modules
pkgname=vcvrack-cvly
pkgver=2.0.1
pkgrel=1
pkgdesc='Cvly VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/Lyqst/cvly-modules'
license=(GPL3)
groups=(proaudio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lyqst/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3bc765ba6d4a011e2c594ea6d05cdc28f65fb71dde0ec9adc7534139e35da6f6')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  # remove common license
  rm "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE
}
