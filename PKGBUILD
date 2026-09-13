# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=Venom
_name=VenomModules
pkgname=vcvrack-venom
pkgver=2.17.0
pkgrel=1
pkgdesc='Venom VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/DaveBenham/VenomModules'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/DaveBenham/$_name#tag=v$pkgver")
sha256sums=('d1d5fa11b0987f48334b1e0d1a33d50f13e85d4ce3d73440e15d608b6c5f0460')

prepare() {
  cd $_name
  # common license
  rm LICENSE-GPLv3.txt
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
