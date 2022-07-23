# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=SonusModular
_name=sonusmodular
pkgname=vcvrack-sonusmodular
pkgver=2.0.0
pkgrel=1
pkgdesc='VCV Rack plugin collection'
arch=(x86_64 aarch64)
url='https://gitlab.com/sonusdept/sonusmodular'
license=(GPL3)
groups=(proaudio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.zip::https://gitlab.com/sonusdept/$_name/-/archive/$pkgver/$_name-$pkgver.zip")
sha256sums=('1168cd4276d70d87ac4843fb3875953ae532f4c356ecd88002ccfbb9ee3d10be')

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
