# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=AuraAudio
_name=auraaudio-vcv-rack
pkgname=vcvrack-auraaudio
pkgver=2.0.0
pkgrel=1
pkgdesc='Aura Audio VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/emurray2/auraaudio-vcv-rack'
license=(MIT)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/emurray2/$_name#tag=v$pkgver")
sha256sums=('c6f5b0d7b71a29338c46778904c7724158c10a12209c681613b720ec24a8f5e6')

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
