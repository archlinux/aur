# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=PitchGrid
_name=PitchGridRack
pkgname=vcvrack-pitchgrid
pkgver=2.1.2
pkgrel=1
pkgdesc='PitchGrid VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/peterjungx/PitchGridRack'
license=(GPL-3.0-or-later CC-BY-NC-ND-4.0)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/peterjungx/$_name#tag=v$pkgver")
sha256sums=('d32c18077d6e8bffc980ef9e378ea6a3d2266541fbc326164cee4e13aa3bc508')

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
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname
}
