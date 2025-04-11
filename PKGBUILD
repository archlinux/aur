# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=Cella
_name=CellaVCV
pkgname=vcvrack-cella
pkgver=2.0.7
pkgrel=1
pkgdesc='Cella VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/victorkashirin/CellaVCV'
license=(GPL-3.0-or-later CC-BY-SA-4.0)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/victorkashirin/$_name#tag=v$pkgver")
sha256sums=('e26c485244807f2b874802cc444fdb22156079887390d12e40dea158864455a9')

prepare() {
  cd $_name
  # common license
  rm LICENSE
}

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE-graphics "$pkgdir"/usr/share/licenses/$pkgname
}
