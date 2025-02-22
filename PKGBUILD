# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=LilacLoop
_name=lilac-loop-vcv
pkgname=vcvrack-lilacloop
pkgver=2.1.6
pkgrel=1
pkgdesc='Lilac Loop VCV Rack modules'
arch=(aarch64 x86_64)
url='https://library.vcvrack.com/LilacLoop'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/grough/lilac-loop-vcv#tag=v$pkgver")
sha256sums=('d26664fca641351e55b917d84cff81f178ffd9cedb8e836f443c29909f583238')

prepare() {
  cd $_name
  # remove common license
  rm LICENSE-GPLv3.txt
}

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
