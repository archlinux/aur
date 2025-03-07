# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=BlackNoiseModular
_name=VCV
pkgname=vcvrack-blacknoisemodular
pkgver=2.0.2
pkgrel=1
pkgdesc='BlackNoiseModular VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/BlackNoiseModular/VCV'
license=(GPL-3.0-or-later CC-BY-NC-ND-4.0)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/BlackNoiseModular/$_name#tag=v$pkgver")
sha256sums=('f7da5531aa96d3d2e2d5edf66c54e2edfb5fd456294ae4d087ca24cb0e7e43f4')

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
