# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=computerscare
_name=computerscare-vcv-modules
pkgname=vcvrack-computerscare
pkgver=2.0.3
pkgrel=1
pkgdesc='Computerscare VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/freddyz/computerscare-vcv-modules'
license=(BSD)
groups=(proaudio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/freddyz/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('df987f89571c836e1d7f1af82bbe3de3dff53b4631d54eacab201b99947328cc')

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
