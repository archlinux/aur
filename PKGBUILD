# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=not-things
_name=not-things-vcv
pkgname=vcvrack-not-things
pkgver=2.0.6
pkgrel=1
pkgdesc='not-things VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/not-things-modular/not-things-vcv'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git nlohmann-json simde zstd)
source=("git+https://github.com/not-things-modular/$_name#tag=v$pkgver")
sha256sums=('263f1e8f2e0492db29cce91f9220d6329751584276659c3c0b3a484937de7a13')

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
