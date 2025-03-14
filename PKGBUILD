# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=MindMeldModular
_name=MindMeldModular
pkgname=vcvrack-mindmeld
pkgver=2.5.0
pkgrel=1
pkgdesc='MindMeld VCV Rack modules'
arch=(aarch64 x86_64)
url='https://marcboule.github.io/MindMeldModular'
license=(GPL-3.0-or-later CC-BY-NC-ND-4.0)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/MarcBoule/$_name#tag=v$pkgver")
sha256sums=('50994e88ee4e436a3e40e35fa09b9ef515a42cfeafecf7122b4277ff6630c162')

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
