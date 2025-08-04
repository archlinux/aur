# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=CVfunk
_name=CVfunk-Modules
pkgname=vcvrack-cv-funk
pkgver=2.0.20
pkgrel=1
pkgdesc='CV funk VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/codygeary/CVfunk-Modules'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/codygeary/$_name#tag=v$pkgver")
sha256sums=('f94496266a5631698cf26afeaa1fae0eaaddd73fc6f25b5c024c11758f4f82f0')

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
}
