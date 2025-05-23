# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="agg"
pkgver="2.6"
_commit="c4f36b4432142f22c0bf82c6fbdb41567a236be2"
_cmake_version="3.31.7"
pkgrel="4"
pkgdesc="AGG Anti-Grain Geometry Library"
arch=("x86_64")
url="https://github.com/ahaerr/agg-2.6"
license=("BSD-3-Clause")
depends=()
makedepends=("libx11")
optdepends=()
source=(
    "https://github.com/ghaerr/agg-2.6/archive/${_commit}.tar.gz"
    "https://github.com/Kitware/CMake/releases/download/v${_cmake_version}/cmake-${_cmake_version}-linux-x86_64.tar.gz"
)
sha256sums=(
    "b56b0328b1467961c1cdc133310fa0588a4b6e3b594f68301756e3601ae530d0"
    "14e15d0b445dbeac686acc13fe13b3135e8307f69ccf4c5c91403996ce5aa2d4"
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-${_commit}" || return
    "${srcdir}/cmake-${_cmake_version}-linux-x86_64/bin/cmake" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -S agg-src \
        -B build && \
    "${srcdir}/cmake-${_cmake_version}-linux-x86_64/bin/cmake" --build build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${_commit}" || return
    DESTDIR="${pkgdir}" \
    "${srcdir}/cmake-${_cmake_version}-linux-x86_64/bin/cmake" --install build && \
    install -Dm644 agg-src/copying "${pkgdir}/usr/share/licenses/agg/copying"
}
