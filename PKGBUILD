# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=lib32-sdl2_ttf
pkgver=2.0.14
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (Version 2, 32 bit)"
arch=('x86_64')
url="https://www.libsdl.org/projects/SDL_ttf/"
license=('MIT')
depends=("${pkgname#*-}>=$pkgver" 'lib32-sdl2' 'lib32-freetype2')
makedepends=('gcc-multilib')
source=("${url}release/SDL2_ttf-$pkgver.tar.gz")
sha256sums=('34db5e20bcf64e7071fe9ae25acaa7d72bdc4f11ab3ce59acc768ab62fe39276')

build() {
  cd SDL2_ttf-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --disable-static --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  make -C SDL2_ttf-$pkgver DESTDIR="$pkgdir/" install

  # remove header file
  rm -rf "$pkgdir"/usr/include

  # link license
  install -d "$pkgdir"/usr/share/licenses
  ln -s ${pkgname#*-} "$pkgdir"/usr/share/licenses/$pkgname
}
