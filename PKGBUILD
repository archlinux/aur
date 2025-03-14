# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=Geodesics
_name=Geodesics
pkgname=vcvrack-geodesics
pkgver=2.3.3
pkgrel=1
pkgdesc='Geodesics VCV Rack modules'
arch=(aarch64 x86_64)
url='https://www.pyer.be/geodesics.html'
license=(GPL-3.0-only BSD-3-Clause CC-BY-NC-SA-4.0)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/MarcBoule/$_name#tag=v$pkgver")
sha256sums=('6d7bb10c57da124d0b02d3a7e20546013b297e046f6e5d7605ba8d8ea651c80c')

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
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE* "$pkgdir"/usr/share/licenses/$pkgname
}
