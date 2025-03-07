# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=OrangeLine
_name=OrangeLine
pkgname=vcvrack-orangeline
pkgver=2.4.6
pkgrel=1
pkgdesc='OrangeLine VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/Stubs42/OrangeLine'
license=(GPL-3.0-only)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/Stubs42/$_name#tag=$pkgver")
sha256sums=('fdb423d63ad6f6d16376fdf6ecdc0716b6e623b8e92f73e7fb742d1dd3af4b02')

prepare() {
  cd $_name
  # common license
  rm LICENSE.txt
}

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
