# Maintainer: Florian Hülsmann <fh@cbix.de>
# Contributor: Miroslav Koškár <http://mkoskar.com/>
# Contributor: David Runge <dave@sleepmap.de>

_slug=Befaco
_name=$_slug
pkgname=vcvrack-${_slug,,}
pkgver=2.2.0
pkgrel=1
pkgdesc='VCV Rack plugin collection'
arch=(x86_64)
url='https://github.com/VCVRack/Befaco'
license=(custom 'CCPL:by-nc' GPL3)
groups=(proaudio vcvrack-plugins)
depends=(vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/VCVRack/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1aa5c32d58e8c7ea3ba9628d5a38ea99287a5f0e54348410161f1b2c66c2f73')

build() {
  cd $_name-$pkgver
  # vcvrack make flags
  export SLUG=$_slug
  export VERSION=$pkgver
  export RACK_DIR=/usr/share/vcvrack
  make dist
}

package() {
  cd $_name-$pkgver
  install -vDm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
