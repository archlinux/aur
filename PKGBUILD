# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=AS
_name=AS
pkgname=vcvrack-as
pkgver=2.0.5
pkgrel=2
pkgdesc='AS VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/AScustomWorks/AS'
license=(MIT CC-BY-NC-ND-4.0)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/AScustomWorks/$_name#tag=v$pkgver")
sha256sums=('642ad28c3e054b83e0e6fc090989c0495ae1d303c55ea3313dab6ce765c928a4')

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname
}
