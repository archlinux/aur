# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=SonusModular
_name=sonusmodular
pkgname=vcvrack-sonusmodular
pkgver=2.1.0
pkgrel=2
pkgdesc='Sonus Modular VCV Rack modules'
arch=(x86_64 aarch64)
url='https://gitlab.com/sonusdept/sonusmodular'
license=(GPL3)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.zip::https://gitlab.com/sonusdept/$_name/-/archive/$pkgver/$_name-$pkgver.zip")
sha256sums=('1220a8f599c06f6ea51372e50e74288bc7589b1aa47f2d82b2655c9377c762c8')

prepare() {
  # remove common license and .gitkeep
  rm $_name-$pkgver/{LICENSE.txt,res/.gitkeep}
}

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
