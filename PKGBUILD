# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=sdl2pp
pkgver=0.17.0
pkgrel=2
pkgdesc="C++ bindings/wrapper for SDL2"
arch=("x86_64")
url="https://github.com/libSDL2pp/libSDL2pp"
license=("ZLIB")
depends=("sdl2" "sdl2_image" "sdl2_mixer" "sdl2_ttf")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/libSDL2pp/libSDL2pp/archive/${pkgver}.tar.gz")
b2sums=("48fa36cd9c3f8b0c3d2b7ae3e075c4ab3bcb3c01b26f10d7f323e813653e56dfb9f1f379eef9e9637901fe0c2f8fe9d6150578c1a2f93be7ecf3cbee799d98ee")

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
