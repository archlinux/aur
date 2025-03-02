# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=not-things
_name=not-things-vcv
pkgname=vcvrack-not-things
pkgver=2.0.1
pkgrel=1
pkgdesc='not-things VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/not-things-modular/not-things-vcv'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/not-things-modular/$_name#tag=v$pkgver")
sha256sums=('b0600d545541cd41579f6dc015e59f4c4e5021e4dcde3d06fc39550cbe2191b3')

prepare() {
  cd $_name
  # common license
  rm LICENSE.md
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
