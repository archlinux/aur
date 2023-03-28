# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=sdl2pp
pkgver=0.18.0
pkgrel=1
pkgdesc="C++ bindings/wrapper for SDL2"
arch=("x86_64")
url="https://sdl2pp.amdmi3.ru"
license=("ZLIB")
depends=("sdl2" "sdl2_image" "sdl2_mixer" "sdl2_ttf")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/libSDL2pp/libSDL2pp/archive/${pkgver}.tar.gz")
b2sums=("c706891d968b2625f88a77adf27ebdc8b57cdad85f250563ba90aa7a0addf624eacfc028b4de22fbb36a35f331a681a12db6775235107f8d48d41449ff91f003")

build() {
  cmake -B "build/" -S "libSDL2pp-${pkgver}" \
    -D SDL2PP_ENABLE_LIVE_TESTS:BOOL="OFF" \
    -D SDL2PP_STATIC:BOOL="OFF" \
    -D SDL2PP_WITH_EXAMPLES:BOOL="OFF" \
    -D SDL2PP_WITH_IMAGE:BOOL="ON" \
    -D SDL2PP_WITH_MIXER:BOOL="ON" \
    -D SDL2PP_WITH_TESTS:BOOL="OFF" \
    -D SDL2PP_WITH_TTF:BOOL="ON" \
    -D CMAKE_BUILD_TYPE:STRING="Release" \
    -D CMAKE_CXX_FLAGS_RELEASE:STRING="-O2 -DNDEBUG" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  install -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" \
    --mode=644 \
    "libSDL2pp-${pkgver}/COPYING.txt"
}
