# Maintainer: Florian Hülsmann <fh@cbix.de>
# Contributor: Miroslav Koškár <http://mkoskar.com/>
# Contributor: David Runge <dave@sleepmap.de>

_slug=Befaco
_name=$_slug
pkgname=vcvrack-${_slug,,}
pkgver=2.8.2
pkgrel=1
pkgdesc='VCV Rack plugin collection'
arch=(aarch64 x86_64)
url='https://github.com/VCVRack/Befaco'
license=(custom  CC-BY-NC-4.0  GPL-3.0-or-later)
groups=(proaudio vcvrack-plugins)
depends=(vcvrack)
makedepends=(simde zstd)
source=("git+https://github.com/VCVRack/$_name#tag=v$pkgver")
sha256sums=('2b4c157e5cfa2954bdd9a6d0194da38f218691c17e990f3e0b7db9f8a5f09607')

build() {
  cd $_name
  # vcvrack make flags
  export SLUG=$_slug
  export VERSION=$pkgver
  export RACK_DIR=/usr/share/vcvrack
  make dist
}

package() {
  cd $_name
  install -vDm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
