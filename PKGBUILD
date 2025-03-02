# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=aridacity
_name=aridacityVCV
pkgname=vcvrack-aridacity
pkgver=2.0.0
pkgrel=3
pkgdesc='Aridacity VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/cubeleco/aridacityVCV'
license=(BSD)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/cubeleco/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2ca0be3831de80384c745d8a7ad51600b76b0705c2e2ad39590ee15b630cf3c1')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
