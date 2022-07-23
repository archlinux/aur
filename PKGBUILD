# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=AaronStatic
_name=AaronStatic_modules
pkgname=vcvrack-aaronstatic
pkgver=2.0
pkgrel=1
pkgdesc='Aaron Static VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/aaronstatic/AaronStatic_modules'
license=(MIT)
groups=(proaudio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/aaronstatic/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('07b10033468ada768088356d31ee3ed327d152d3f92c437d1df7a041f98425c4')

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
