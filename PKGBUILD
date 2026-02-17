# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=Autinn
_name=Autinn
pkgname=vcvrack-autinn
pkgver=2.6.27
pkgrel=1
pkgdesc='Autinn VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/NikolaiVChr/Autinn'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/NikolaiVChr/$_name#tag=v$pkgver")
sha256sums=('17a855f89e107e24789ca24e8aa57248afa4aa3ffeb1fd8ad56f1203fd25556e')

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
