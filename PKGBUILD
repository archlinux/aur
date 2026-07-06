# Maintainer: Damglador <damglador@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=lib32-sdl2_image
pkgver=2.8.12
pkgrel=1
pkgdesc='A simple library to load images of various formats as SDL surfaces'
arch=(x86_64)
url=https://www.libsdl.org/projects/SDL_image/
license=(MIT)
depends=(
  lib32-glibc
  lib32-libjpeg-turbo
  lib32-libpng
  lib32-libtiff
  lib32-sdl2
  lib32-libwebp
  sdl2_image
)
source=("https://github.com/libsdl-org/SDL_image/releases/download/release-${pkgver}/SDL2_image-${pkgver}.tar.gz"{,.sig})
sha512sums=('c2574d83f8ee89b97cc992fe6a579c87a1b9a1aa7a8a3cfb6bf58f10d3880a157d70cd053767cc2ade1bd124e102356a50274d688e24b2e04a375588e54114ac'
            'SKIP')
validpgpkeys=('0900104363B4C9D4223DE149D913FE7D4B61D39B')

build() {
  cd "${srcdir}/SDL2_image-${pkgver}/"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
  ./configure --disable-static --prefix=/usr --libdir=/usr/lib32 \
    --disable-avif-shared \
    --disable-jpg-shared \
    --disable-png-shared \
    --disable-stb-image \
    --disable-tif-shared \
    --disable-jxl-shared \
    --disable-webp-shared
  make
}

package() {
  cd "${srcdir}/SDL2_image-${pkgver}/"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s sdl2_image "$pkgdir"/usr/share/licenses/lib32-sdl2_image
}

# vim: ts=2 sw=2 et:
