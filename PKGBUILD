# Maintainer: nm10923 https://nm10923.xyz/contact
pkgname=sdl3_image-git
pkgver=r1552.94d8471
pkgrel=1
pkgdesc="Image decoding for many popular formats for Simple Directmedia Layer (Version 3)"
arch=('x86_64')
url="https://github.com/libsdl-org/SDL_image.git"
license=('zlib')
depends=('sdl3' 'aom' 'dav1d' 'libavif' 'libjpeg' 'libjxl' 'libpng' 'libtiff' 'libwebp' 'zlib' )
source=("git+https://github.com/libsdl-org/SDL_image")
sha256sums=('SKIP')
provides=('sdl3_image')
conflicts=('sdl3_image')

pkgver() {
  cd "${srcdir}/SDL_image"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/SDL_image"
  cmake -B build -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/SDL_image"
  DESTDIR="${pkgdir}" cmake --install build
}
