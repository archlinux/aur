# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=dbRackSequencer
_name=dbRackSequencer
pkgname=vcvrack-dbrack-sequencer
pkgver=2.6.1
pkgrel=1
pkgdesc='dbRack sequencer VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/docb/dbRackSequencer'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/docb/$_name#tag=v$pkgver")
sha256sums=('aa3d08f1cb251ef78f7e9d6e7f6da8f8fc7e5cfd39ddb05ef4f87a16bf5d4c4b')

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
