# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=scanner-darkly-collection-one
_name=vcv-collection-one
pkgname=vcvrack-collection-one
pkgver=2.0.4
pkgrel=2
pkgdesc='Collection One VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/scanner-darkly/vcv-collection-one'
license=(GPL3)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/scanner-darkly/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93cf9df21394bd651a7cdbc8d32f927d422f3aaf7729f7b96be1181408093d1d')

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
