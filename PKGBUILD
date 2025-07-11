# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=alefsbits
_name=alefsbits
pkgname=vcvrack-alefsbits
pkgver=2.5.60
pkgrel=1
pkgdesc="alef's bits VCV Rack modules"
arch=(x86_64 aarch64)
url='https://github.com/alefnull/alefsbits'
license=(GPL3)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alefnull/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c81d19ff0b86bc442222bae7d70bec4c6adaa948afe3f6d3b951a2c2764474b2')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
