# Ruijie Yu (first.last@outlook.com)
pkgname=ctre
_pkgname=compile-time-regular-expressions
pkgver=3.2
pkgrel=1
pkgdesc='A Compile time PCRE (almost) compatible regular expression matcher'
url="https://github.com/hanickadot/$_pkgname/"
arch=(any)
license=(Apache-2.0)
depends=()
optdepends=(
'gcc: c++ compiler'
'clang: c++ compiler'
)
makedepends=(git cmake make)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
    "$url/archive/v$pkgver.tar.gz"
)
sha512sums=('853559fbb808610dad0a825d85db5e6fe9398a2c7838dfde93e0766f2072104ff063a7ae1bf4ce49e3b12c977bc51861855d023527c764631875dfd41cc09ad4')
_cmake_config=Release

_extracted="$_pkgname-$pkgver"

prepare() {
    cd "${srcdir}/${_extracted}"
    cmake \
        --warn-uninitialized \
        --warn-unused-vars \
        -S . -B build
}

build() {
    cmake \
        --build "${srcdir}/${_extracted}/build" \
        --config "$_cmake_config" \
        -j
}

check() {
    cd "${srcdir}/${_extracted}/build"
    ctest \
        --no-tests=ignore \
        --output-on-failure \
        --progress
}

package() {
    cmake \
        --install "${srcdir}/${_extracted}/build" \
        --prefix "${pkgdir}/usr/" \
        --config "$_cmake_config"
}


