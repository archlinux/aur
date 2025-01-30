# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=computerscare
_name=computerscare-vcv-modules
pkgname=vcvrack-computerscare
pkgver=2.1.11
pkgrel=2
pkgdesc='Computerscare VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/freddyz/computerscare-vcv-modules'
license=(BSD-3-Clause)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/freddyz/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30a599a8998b2fa0ac813026c00d473e52b6cacbf9b530b57dcd5399ba0b7006')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname
}
