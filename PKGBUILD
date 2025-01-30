# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=21kHz
_name=21kHz-rack-plugins
pkgname=vcvrack-21khz
pkgver=2.0.1
pkgrel=2
pkgdesc='21kHz VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/netboy3/21kHz-rack-plugins'
license=(MIT)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/netboy3/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b040206610e0595a15a9e5179810e7f0c43a0ce8f332d04e21289817431882a1')

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
