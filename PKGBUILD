# Maintainer: Monjaris <ziyanovruzlu750@gmail.com>
pkgname=sdl3pp-git
_pkgname=SDL3pp
pkgver=0.11.3.r18.g993f720
pkgrel=1
pkgdesc="Header-only and modern C++ wrapper for SDL3"
arch=('any')
url="https://github.com/talesm/SDL3pp"
license=('Zlib')
options=(!debug)
depends=('sdl3' 'sdl3_image')
makedepends=('git' 'cmake')
provides=('sdl3pp')
conflicts=('sdl3pp')
source=("git+https://github.com/talesm/SDL3pp.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSDL3PP_FORCE_BUNDLED=OFF \
    -DSDL3PP_ENABLE_IMAGE=ON \
    -DSDL3PP_ENABLE_MIXER=OFF \
    -DSDL3PP_ENABLE_NET=OFF \
    -DSDL3PP_ENABLE_TTF=OFF \
    -DSDL3PP_BUILD_EXAMPLES=OFF \
    -DSDL3PP_BUILD_TESTING=OFF \
    -DSDL3PP_GEN_DOCS=OFF \
    -DSDL3PP_GEN_HEADERS=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
