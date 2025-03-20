# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=FreeSurface
_name=FreeSurface
pkgname=vcvrack-freesurface
pkgver=2.1.6
pkgrel=1
pkgdesc='Casual Systems/Free Surface VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/freesurfacemodules/FreeSurface'
license=(GPL-3.0-only)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/freesurfacemodules/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8c9ac0ab4c644d34c752b9a939d486e579f6a468adcc447857df4e2e76cbe68e')

build() {
  cd $_name-$pkgver
  LDFLAGS+=" $(pkg-config --libs samplerate)" \
    make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  # remove common license
  rm "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE*
}
