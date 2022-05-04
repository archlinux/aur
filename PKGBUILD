# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=lib32-sdl2_ttf
pkgver=2.0.18
pkgrel=1
pkgdesc='Library that allows you to use TrueType fonts in your SDL applications (Version 2) (32-bit)'
url='https://www.libsdl.org/projects/SDL_ttf'
arch=('x86_64')
license=('MIT')
depends=('lib32-sdl2' 'lib32-freetype2')
source=(https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${pkgver}.tar.gz)
sha512sums=('9a211c07d4180fe3fb2f7614e907d1002ddf3bb77b57f62116f22dc29a6043f091deb6a8113656d26a44d2f06b9abcc372aa3e0761500fcf47b455406973a1c7')

prepare() {
  cd SDL2_ttf-${pkgver}
  touch NEWS README AUTHORS ChangeLog
  autoreconf -vi
}

build() {
  cd SDL2_ttf-${pkgver}
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure --disable-static --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd SDL2_ttf-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/include"
  install -Dm 644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
