# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=Bastl
_name=bastl-vcv
pkgname=vcvrack-bastl
pkgver=2.0.0
pkgrel=3
pkgdesc='Bastl VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/hemmer/bastl-vcv'
license=(GPL3)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/hemmer/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e8772c2f088a78bb3cf42611d039c46b8bdf29b129537b68ae186a5d871ec559')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  # remove common license
  rm "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE-GPLv3.txt
}
