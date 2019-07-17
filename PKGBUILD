# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=lib32-sdl2_image
pkgver=2.0.5
pkgrel=1
pkgdesc='A simple library to load images of various formats as SDL surfaces'
arch=(x86_64)
url=https://www.libsdl.org/projects/SDL_image/
license=(MIT)
depends=(
  lib32-glibc
  lib32-libjpeg
  lib32-libpng
  lib32-libtiff
  lib32-sdl2
  lib32-libwebp
  sdl2_image
)
makedepends=(
  cmake
  mercurial
)
source=(hg+https://hg.libsdl.org/SDL_image#tag=release-${pkgver})
sha256sums=(SKIP)

prepare() {
  cd SDL_image

  ./autogen.sh
}

build() {
  cd SDL_image

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static
  make
}

package() {
  make DESTDIR="${pkgdir}" -C SDL_image install
  rm -rf "${pkgdir}"/usr/include

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s sdl2_image "$pkgdir"/usr/share/licenses/lib32-sdl2_image
}

# vim: ts=2 sw=2 et:
