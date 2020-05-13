# Maintainer: Luis Marques <luigoalma at gmail dot com>

pkgname=simple2d
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple, open-source 2D graphics for everyone"
arch=('i686' 'x86_64')
url="https://github.com/simple2d/simple2d"
license=('MIT')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
options=('staticlibs' '!emptydirs')
source=(simple2d-v${pkgver}.tar.gz::https://github.com/simple2d/simple2d/archive/v${pkgver}.tar.gz)
sha256sums=('72fe2f9e1684f846d8f373a0c14452c7191e354ef3cd9ddb3a9a2a7c1a7e2ab2')

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
