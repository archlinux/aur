# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=lib32-sdl2_image
pkgver=2.0.1
pkgrel=2
pkgdesc='A simple library to load images of various formats as SDL surfaces'
arch=('x86_64')
url='https://www.libsdl.org/projects/SDL_image/'
license=('MIT')
depends=('lib32-glibc' 'lib32-libjpeg' 'lib32-libpng' 'lib32-libtiff'
         'lib32-sdl2' 'lib32-libwebp' 'sdl2_image')
makedepends=('cmake')
source=("https://www.libsdl.org/projects/SDL_image/release/SDL2_image-${pkgver}.tar.gz")
sha256sums=('3a3eafbceea5125c04be585373bfd8b3a18f259bd7eae3efc4e6d8e60e0d7f64')

build() {
  cd SDL2_image-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-static
  make
}

package() {
  cd SDL2_image-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s sdl2_image "$pkgdir"/usr/share/licenses/lib32-sdl2_image
}

# vim: ts=2 sw=2 et:
