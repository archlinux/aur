# Maintainer: Luis Marques <luigoalma at gmail dot com>

pkgname=simple2d
pkgver=0.9.0
pkgrel=2
pkgdesc="Simple, open-source 2D graphics for everyone"
arch=('i686' 'x86_64')
url="https://github.com/simple2d/simple2d"
license=('MIT')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
options=('staticlibs' '!emptydirs')
source=(simple2d-v${pkgver}.tar.gz::https://github.com/simple2d/simple2d/archive/v${pkgver}.tar.gz)
sha256sums=('c03497b47a74dd220be8ff3aeedfa42bce36babd23df582281bf0f0c8b48ef0f')

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
