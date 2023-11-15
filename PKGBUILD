# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=alefsbits
_name=alefsbits
pkgname=vcvrack-alefsbits
pkgver=2.5.52
pkgrel=1
pkgdesc="alef's bits VCV Rack modules"
arch=(x86_64 aarch64)
url='https://github.com/alefnull/alefsbits'
license=(GPL3)
groups=(proaudio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alefnull/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7dbcc91a8fa13f3bd7c4c18b76997076c2b054bc34659db6bacfe226484e415a')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
