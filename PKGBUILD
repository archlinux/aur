# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=FreeSurface
_name=FreeSurface
pkgname=vcvrack-freesurface
pkgver=2.1.1
pkgrel=1
pkgdesc='Casual Systems/Free Surface VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/freesurfacemodules/FreeSurface'
license=(GPL3)
groups=(proaudio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/freesurfacemodules/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d941123c1e9b001546bb09d6e68897c772511e924e3c59ff79fc29d0b3d07ec6')

build() {
  cd $_name-$pkgver
  LDFLAGS+=" $(pkg-config --libs samplerate)" \
    make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  # remove common license
  rm "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE*
}
