# Maintainer: Florian Hülsmann <fh@cbix.de>
# Contributor: Miroslav Koškár <http://mkoskar.com/>
# Contributor: David Runge <dave@sleepmap.de>

_slug=Befaco
_name=Befaco
pkgname=vcvrack-befaco
pkgver=2.9.1
pkgrel=1
pkgdesc='VCV Rack plugin collection'
arch=(aarch64 x86_64)
url='https://github.com/VCVRack/Befaco'
license=(custom  CC-BY-NC-4.0  GPL-3.0-or-later)
groups=(proaudio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/VCVRack/$_name#tag=v$pkgver")
sha256sums=('c4351e5fef5ba3dab4fd445089c79a3d9750c02110a6e42100a2a31335c0b10b')

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -vDm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
