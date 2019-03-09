# Maintainer: Luis Marques <luigoalma at gmail dot com>

pkgname=simple2d
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple, open-source 2D graphics for everyone"
arch=('i686' 'x86_64')
url="https://github.com/simple2d/simple2d"
license=('MIT')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
options=('staticlibs' '!emptydirs')
source=(simple2d-v${pkgver}.tar.gz::https://github.com/simple2d/simple2d/archive/v${pkgver}.tar.gz)
sha256sums=('de621fbdff69a1ded2efe51f2b088f3e572dbd9f1a1eb772fce813774234a66a')

build() {
  cd "$srcdir"/simple2d-${pkgver}
  #maybe do a patch to load to makefile to load them instead of manually changing this every time if need be
  make CFLAGS="$CFLAGS $CPPFLAGS -std=c11 -fPIC"
}

package() {
  cd "$srcdir"/simple2d-${pkgver}
  make install PREFIX="$pkgdir"/usr
  rm -rf "$pkgdir"/usr/bin
}
