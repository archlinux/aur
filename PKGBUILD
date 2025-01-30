# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=alefsbits
_name=alefsbits
pkgname=vcvrack-alefsbits
pkgver=2.5.54
pkgrel=2
pkgdesc="alef's bits VCV Rack modules"
arch=(x86_64 aarch64)
url='https://github.com/alefnull/alefsbits'
license=(GPL3)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alefnull/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c0b2b7270ec8e4ed8efc8bd0d761a0099d04aeb1c08e50fae2a133367cdc97be')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
