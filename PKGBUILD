# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=mscHack
_name=mschack-VCV-Rack-Plugins
pkgname=vcvrack-mschack
pkgver=2.0.0
pkgrel=1
pkgdesc='mscHack VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/baconpaul/mschack-VCV-Rack-Plugins'
license=(BSD-3-Clause)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/baconpaul/$_name#tag=v$pkgver")
sha256sums=('67f275a3a10897ae1fc25c29d85b94e7fc0e5a45c1c855113540193e41c33ea0')

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname
}
