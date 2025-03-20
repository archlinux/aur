# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=wildergarden
_name=wildergarden-vcv
pkgname=vcvrack-wildergarden
pkgver=2.1.0
pkgrel=1
pkgdesc='Wildergarden VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/ArdenButterfield/wildergarden-vcv'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git jq simde zstd)
source=("git+https://github.com/ArdenButterfield/$_name#tag=v$pkgver")
sha256sums=('d166d77d098aca8df3fd62236d41b06011a7075f71df6176353048ff0f46e68b')

prepare() {
  cd $_name
  # remove common license
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
