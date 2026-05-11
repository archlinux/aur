# Maintainer: Blaadick <null>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname="mingw-w64-nlohmann-json"
pkgver="3.12.0"
pkgrel=1
pkgdesc="Header-only JSON library for Modern C++ (mingw-w64)"
url="https://github.com/nlohmann/json"
license=("MIT")
arch=("any")
depends=("mingw-w64-crt")
makedepends=("mingw-w64-cmake")
options=("!buildflags" "!strip" "staticlibs")
source=("https://github.com/nlohmann/json/archive/v${pkgver}.tar.gz")
sha256sums=("4b92eb0c06d10683f7447ce9406cb97cd4b453be18d7279320f7b2f025c10187")

build() {
    cd "$srcdir/json-${pkgver}"

    for arch in ${_architectures[@]}; do
        $arch-cmake -DJSON_BuildTests=OFF -DJSON_MultipleHeaders=ON -B "build-${arch}" -S .
        cmake --build "build-${arch}"
    done
}

package() {
    cd "$srcdir/json-${pkgver}"

    for arch in ${_architectures[@]}; do
        DESTDIR="$pkgdir" cmake --install "build-${arch}"
    done
}
