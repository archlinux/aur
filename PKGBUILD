# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=lib32-sdl3_ttf
pkgver=3.2.2
pkgrel=1
pkgdesc='Library that allows you to use TrueType fonts in your SDL applications (Version 3) (32-bit)'
url='https://www.libsdl.org/projects/SDL_ttf'
arch=('x86_64')
license=('MIT')
depends=('lib32-glibc' 'lib32-sdl3' 'lib32-freetype2' 'lib32-harfbuzz')
makedepends=('cmake')
source=("https://github.com/libsdl-org/SDL_ttf/releases/download/release-${pkgver}/SDL3_ttf-${pkgver}.tar.gz"{,.sig})
sha512sums=('3cbab124642e23bd751f5a919c0094c8f9e004b566fbd57e6a61f92d0c8d0a14b9b6613faaff8093c4e523a81f07a4145870c29e1eb66eb5b5a5ff2c37c0806b'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
  CFLAGS+=" -ffat-lto-objects"

  local cmake_options=(
    -B build
    -S SDL3_ttf-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "SDL3_ttf-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
