# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=tsotc
pkgver=2.2.1.1
pkgrel=1
pkgdesc="The Secret of Tremendous Corporation - a point'n'click adventure game about Max Burton, young game developer wannabe, on an unexpected mission to save the game industry."
arch=('i686' 'x86_64')
url='http://tremendouscorp.com/'
license=('GPL3' 'LGPL')
depends=('glee' 'alure' 'libvpx' 'sdl' 'dumb' 'xdg-utils')
makedepends=('sludge')
source=("http://tremendouscorp.com/downloads/sources/tsotc_$pkgver.orig.tar.gz" "http://tremendouscorp.com/downloads/sources/tsotc-game_$pkgver.src.tar.gz")
sha256sums=('7f241bf2bf237e719a63a93cfa7c3c104ca13d2d88d14d7b70d685e6907e0a60' '7b0fa2a26288f04f4a28608ef3d789ce66f49cf18b3bb7cba9339c0d9aa23f88')

build() {
  cd opensludge
  ./autogen.sh
  ./configure --prefix=/usr
  cd ../tsotc
  make
}

package() {
  cd opensludge
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr"
  cp -r share "$pkgdir/usr/"
  cd ../tsotc
  cp gamedata.slg "$pkgdir/usr/share/tsotc/"
}
