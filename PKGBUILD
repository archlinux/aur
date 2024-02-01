# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: chn <g897331845@gmail.com>

pkgname=nameof
pkgver=0.10.4
pkgrel=1
pkgdesc="Nameof operator for modern C++,
         simply obtain the name of a variable, type, function, macro, and enum"
arch=("any")
url="https://github.com/Neargye/nameof"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Neargye/nameof/archive/v${pkgver}.tar.gz")
b2sums=("34d844adf0f6795e6e62fde23256d90f9296b9a7a3859ff0676cc30266430768cdfec3d7c820eb78e9bedd07c7baed2f9ec205b8391b73e4f7095022af63ae91")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D NAMEOF_OPT_BUILD_EXAMPLES:BOOL="OFF" \
    -D NAMEOF_OPT_BUILD_TESTS:BOOL="OFF" \
    -D NAMEOF_OPT_INSTALL:BOOL="ON" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  install -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" \
    --mode=644 \
    "${pkgname}-${pkgver}/LICENSE"
}
