# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=dbRackSequencer
_name=dbRackSequencer
pkgname=vcvrack-dbrack-sequencer
pkgver=2.6.2
pkgrel=1
pkgdesc='dbRack sequencer VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/docb/dbRackSequencer'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/docb/$_name#tag=v$pkgver")
sha256sums=('1519e3a74e7611429b05bf16f2d3b46ca179d6968bcaaf58e911554dcd129928')

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
