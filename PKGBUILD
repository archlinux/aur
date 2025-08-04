# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=alefsbits
_name=alefsbits
pkgname=vcvrack-alefsbits
pkgver=2.5.62
pkgrel=1
pkgdesc="alef's bits VCV Rack modules"
arch=(x86_64 aarch64)
url='https://github.com/alefnull/alefsbits'
license=(GPL3)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alefnull/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5bc76e663309268390aea21c4150fcf0d66ce47343d86ae6d23289e415d60ea1')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
