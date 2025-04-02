# Maintainer: Dario Cvitanović <dario.cvitanovic04@gmail.com>

pkgname=sdl3_ttf
pkgver=3.2.2
pkgrel=1
pkgdesc="Support for TrueType font files with Simple Directmedia Layer (Version 3)"
arch=('x86_64')
url="https://github.com/libsdl-org/SDL_ttf"
license=('0BSD')
depends=('sdl3' 'freetype2' 'harfbuzz')
makedepends=('cmake')
conflicts=('sdl3_ttf-git')
source=("https://github.com/libsdl-org/SDL_ttf/releases/download/release-${pkgver}/SDL3_ttf-${pkgver}.tar.gz")
sha256sums=('63547d58d0185c833213885b635a2c0548201cc8f301e6587c0be1a67e1e045d')

build() {
  cmake -B build -S "SDL3_ttf-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DSDLTTF_PLUTOSVG=OFF \
    -DSDLTTF_SAMPLES=OFF \

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "SDL3_ttf-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
