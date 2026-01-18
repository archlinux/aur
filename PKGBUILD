# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann

_slug=SickoCV
_name=SickoCV
pkgname=vcvrack-sicko-cv
pkgver=2.7.8
pkgrel=1
pkgdesc='SickoCV VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/sickozell/SickoCV'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/sickozell/$_name#tag=v$pkgver")
sha256sums=('c49f7267ca4e7c0e0885d9d52309542ddd8317a6486c5bca84f8853e276749c6')

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
