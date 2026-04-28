# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=computerscare
_name=computerscare-vcv-modules
pkgname=vcvrack-computerscare
pkgver=2.2.5
pkgrel=1
pkgdesc='Computerscare VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/freddyz/computerscare-vcv-modules'
license=(BSD-3-Clause)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/freddyz/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50aed70048cfc1f7bf0ed1f4880b5582a0e44a4704bf58bb1c661199813f1423')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname
}
