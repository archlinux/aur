# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=ZetaCarinae
_name=ZetaCarinaeModules
pkgname=vcvrack-zetacarinae
pkgver=2.0.4
pkgrel=3
pkgdesc='ZetaCarinae VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/mhampton/ZetaCarinaeModules'
license=(GPL3)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mhampton/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('24e4b92fdccd4fbce41df833daf5c366c9032075ac57e39a5cee52421592ee3b')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  # remove common license
  rm "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE
}
