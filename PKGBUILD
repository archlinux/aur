# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=lib32-sdl2_ttf
pkgver=2.20.0
pkgrel=1
pkgdesc='Library that allows you to use TrueType fonts in your SDL applications (Version 2) (32-bit)'
url='https://www.libsdl.org/projects/SDL_ttf'
arch=('x86_64')
license=('MIT')
depends=('lib32-sdl2' 'lib32-freetype2')
source=("https://github.com/libsdl-org/SDL_ttf/releases/download/release-${pkgver}/SDL2_ttf-${pkgver}.tar.gz"{,.sig})
sha512sums=('14c78cfa04b938f0bd141d841a9473a1678bb04d01a96391cfa37ae3e7e316c90f175aff7d052499f7d982f59b823813e4cfdd367631a44b08b85f9b60d09c8c'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6')

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
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
