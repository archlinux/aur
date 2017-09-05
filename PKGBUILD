# Maintainer: Morten Linderd <morten@linderud.pw>

pkgname=nageru
pkgver=1.6.2
pkgrel=1
pkgdesc="live video mixer, based around the standard M/E workflow."
arch=(x86_64)
url="https://nageru.sesse.net/"
license=('GPL3')
depends=('libmicrohttpd' 'lua52' 'ffmpeg' 'libx264' 'protobuf' 
         'movit' 'bmusb' 'qcustomplot-qt5' 'pciutils' 'zita-resampler')
makedepends=('eigen')
source=("https://nageru.sesse.net/nageru-${pkgver}.tar.gz")
sha256sums=('090c48091fb17ea48c95c210b15de844c6d14e63464cd3e4cebd3fa338e572dc')

build() {
  cd "$pkgname-$pkgver"
  make
}

prepare(){
  cd "$pkgname-$pkgver"
  sed -i "s|local/||g" flags.h
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
