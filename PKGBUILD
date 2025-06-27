# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=dbRackSequencer
_name=dbRackSequencer
pkgname=vcvrack-dbrack-sequencer
pkgver=2.6.3
pkgrel=1
pkgdesc='dbRack sequencer VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/docb/dbRackSequencer'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/docb/$_name#tag=v$pkgver")
sha256sums=('210f3b08fa8cec451f88986fc22bd0d210d7fe5b6144233e56e920e6421a8423')

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
