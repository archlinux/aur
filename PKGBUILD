# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=8Mode
_name=8Mode-VCV_Modules
pkgname=vcvrack-8mode
pkgver=2.0
pkgrel=2
pkgdesc='8Mode VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/8Mode/8Mode-VCV_Modules'
license=(BSD)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/8Mode/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c69c38dc27acdf0df7bb009ddcac81e06a4353954c3ffada5550193b79b342ea')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
