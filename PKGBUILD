# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=Venom
_name=VenomModules
pkgname=vcvrack-venom
pkgver=2.14.4
pkgrel=1
pkgdesc='Venom VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/DaveBenham/VenomModules'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/DaveBenham/$_name#tag=v$pkgver")
sha256sums=('2433e91d2b99ea664c2998125742a72e71077049a88c2ab656f4fb050c430975')

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
