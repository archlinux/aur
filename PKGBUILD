# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=GoodSheperd
_name=GoodSheperd
pkgname=vcvrack-goodsheperd
pkgver=2.0.0
pkgrel=2
pkgdesc='GoodSheperd VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/jensschulze/GoodSheperd'
license=(GPL3)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jensschulze/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c0c7a94bec0b4faee7ad75c250553831a12eae63246873433a3389ce7bb6efaf')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  # remove common license
  rm "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE.txt
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE-dist.txt \
    "$pkgdir"/usr/share/licenses/$pkgname
}
