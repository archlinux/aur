# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=AmalgamatedHarmonics
_name=AmalgamatedHarmonics
pkgname=vcvrack-amalgamated-harmonics
pkgver=2.0.1
pkgrel=1
pkgdesc='Amalgamated Harmonics VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/jhoar/AmalgamatedHarmonics'
license=(BSD OFL Apache)
groups=(proaudio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jhoar/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d322d5f35c1557a3ffd76f1c603db69298df4560b7a2d5ac33ccbc89a0fa6f4a')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/{LICENSE,res/*-LICENSE.txt} \
    "$pkgdir"/usr/share/licenses/$pkgname
}
