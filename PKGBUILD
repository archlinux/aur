# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=AlliewayAudio_Freebies
_name=AlliewayAudio_Freebies
pkgname=vcvrack-alliewayaudio-freebies
pkgver=2.0.7
pkgrel=3
pkgdesc='Allieway Audio free VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/AlliewayAudio/AlliewayAudio_Freebies'
license=(GPL3)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlliewayAudio/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c1514eb278b9e622a3d53b1c582657e495efc437e7e50c735b38d07ea08f157b')

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  # remove common license
  rm "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE.txt
}
