# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=Valley
_name=ValleyRackFree
pkgname=vcvrack-valley
pkgver=2.4.5
pkgrel=1
pkgdesc='Valley VCV Rack modules'
arch=(aarch64 x86_64)
url='https://valleyaudio.github.io'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/ValleyAudio/$_name#tag=$pkgver")
sha256sums=('99598f96184da960b05a33db42c0b406a1921570d5d896d41207ea7f3984cbf5')

prepare() {
  cd $_name
  # common license
  rm LICENSE*
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
