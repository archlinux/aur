# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=lib32-sdl2_ttf-git
pkgver=2.0.15
pkgrel=1
pkgdesc='Library that allows you to use TrueType fonts in your SDL applications (Version 2) (32-bit)'
url='https://www.libsdl.org/projects/SDL_ttf'
arch=('x86_64')
license=('MIT')
makedepends=(git)
depends=('lib32-sdl2' 'lib32-freetype2')
provides=(lib32-sdl2_ttf)
conflicts=(lib32-sdl2_ttf)
source=(git+https://github.com/libsdl-org/SDL_ttf)
sha512sums=('SKIP')

pkgver() {
  cd SDL_ttf
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd SDL_ttf
  touch NEWS README AUTHORS ChangeLog
  autoreconf -vi
}

build() {
  cd SDL_ttf
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure --disable-static --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd SDL_ttf
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/include"
  install -Dm 644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
