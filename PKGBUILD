# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=squinktronix-plug1
_name=SqHarmony
pkgname=vcvrack-squinktronix
pkgver=2.2.1
pkgrel=1
pkgdesc='Squinktronix VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/squinkylabs/SqHarmony'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/squinkylabs/$_name#tag=v$pkgver")
sha256sums=('00aeb899d68f75be01bc3bba7505fa74d91b7dc3df699ce07a852416a0f30c74')

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
