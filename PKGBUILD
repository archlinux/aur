# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann

_slug=SickoCV
_name=SickoCV
pkgname=vcvrack-sicko-cv
pkgver=2.7.6
pkgrel=1
pkgdesc='SickoCV VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/sickozell/SickoCV'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/sickozell/$_name#tag=v$pkgver")
sha256sums=('0a730880852900b1a3224ffc4d1375c30ecc2896ef053d172b0f099ba0647c6a')

prepare() {
  cd $_name
  # common license
  rm LICENSE
}

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
