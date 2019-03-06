# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=lib32-sdl2_ttf
pkgver=2.0.15
pkgrel=1
pkgdesc='Library that allows you to use TrueType fonts in your SDL applications (Version 2) (32-bit)'
url='https://www.libsdl.org/projects/SDL_ttf'
arch=('x86_64')
license=('MIT')
depends=('lib32-sdl2' 'lib32-freetype2')
source=(https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${pkgver}.tar.gz)
sha512sums=('30d685932c3dd6f2c94e2778357a5c502f0421374293d7102a64d92f9c7861229bf36bedf51c1a698b296a58c858ca442d97afb908b7df1592fc8d4f8ae8ddfd')

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
