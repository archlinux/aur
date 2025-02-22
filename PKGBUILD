# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=Sha-Bang-Modules
_name=Sha-Bang-Modules
pkgname=vcvrack-sha-bang-modules
pkgver=2.2.2
pkgrel=1
pkgdesc='Sha#Bang! VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/jeremymuller/Sha-Bang-Modules'
license=(GPL-3.0-only)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/jeremymuller/$_name#tag=v$pkgver")
sha256sums=('d63c93e6a4c76375f078829d471c065279d20e0941ad524bbca68fc7dafe12b8')

prepare() {
  cd $_name
  # remove common license
  rm LICENSE
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
