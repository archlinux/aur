# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=SonusModular
_name=sonusmodular
pkgname=vcvrack-sonusmodular
pkgver=2.1.1
pkgrel=1
pkgdesc='Sonus Modular VCV Rack modules'
arch=(x86_64 aarch64)
url='https://gitlab.com/sonusdept/sonusmodular'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.zip::https://gitlab.com/sonusdept/$_name/-/archive/$pkgver/$_name-$pkgver.zip")
sha256sums=('122f59d7116b23af9ec5ce1b134c9a43d471b4c5f6ec96ca10fb6c3110ccb552')

prepare() {
  # remove common license and .gitkeep
  rm $_name-$pkgver/{LICENSE.txt,res/.gitkeep}
}

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
