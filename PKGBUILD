# Maintainer: nm10923 https://nm10923.xyz/contact
pkgname=sdl3_ttf-git
pkgver=r987.5986e15
pkgrel=1
pkgdesc="Support for TrueType (.ttf) font files with Simple Directmedia Layer (Version 3)"
arch=('x86_64')
url="https://github.com/libsdl-org/SDL_ttf.git"
license=('zlib')
depends=( 'sdl3' 'freetype2' 'harfbuzz' )
source=("git+https://github.com/libsdl-org/SDL_ttf")
sha256sums=('SKIP')
provides=('sdl3_ttf')
conflicts=('sdl3_ttf')

pkgver() {
  cd "${srcdir}/SDL_ttf"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/SDL_ttf"
  cmake -B build -D SDLTTF_SAMPLES=OFF -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/SDL_ttf"
  DESTDIR="${pkgdir}" cmake --install build
}
