# Maintainer: Morten Linderd <morten@linderud.pw>

pkgname=nageru
pkgver=1.6.1
pkgrel=4
pkgdesc="live video mixer, based around the standard M/E workflow."
arch=(x86_64)
url="https://nageru.sesse.net/"
license=('GPL3')
depends=('libmicrohttpd' 'lua52' 'ffmpeg' 'libx264' 'protobuf' 
         'movit' 'bmusb' 'qcustomplot-qt5' 'pciutils' 'zita-resampler')
makedepends=('eigen')
source=("https://nageru.sesse.net/nageru-${pkgver}.tar.gz")
sha256sums=('218ef18fef68afbaab2b5e0d09ee817455cc340a980f37068d8a3de22f53aefa')

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
