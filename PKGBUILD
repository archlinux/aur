# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=dbRackModules
_name=dbRackModules
pkgname=vcvrack-dbrack-modules
pkgver=2.7.0
pkgrel=1
pkgdesc='dbRack VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/docb/dbRackModules'
license=(GPL-3.0-or-later MIT)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/docb/$_name#tag=v$pkgver")
sha256sums=('6df992779f9ebc06f0a5646d6fe80e773016aca9956028b62023a8f78d0d1e8a')

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
  install -vDm644 Gamma/COPYRIGHT -t "$pkgdir"/usr/share/licenses/$pkgname
}
