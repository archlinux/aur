# Ruijie Yu (first.last@outlook.com)
pkgname=semver-cpp
_pkgname="$pkgname"
__pkgname="${_pkgname%-cpp}"
pkgver=0.2.2
pkgrel=1
pkgdesc='Semantic Versioning for modern C++'
url="https://github.com/Neargye/semver"
arch=(any)
license=(MIT)
depends=()
optdepends=(
'gcc: c++ compiler'
'clang: c++ compiler'
)
makedepends=(cmake make)
source=(
    # extracted: semver-0.2.2
    "$url/archive/v$pkgver.tar.gz"
)
sha512sums=('f299e6d74f0232f40e20959ed3d7138d5faff924f60748827849e21951d76d34070bac2479a35f3ea6e801ec5e23ebf8391adedc70d778c4aa5e4c89b20c332c')
_cmake_config=Release

_extracted="$__pkgname-$pkgver"
prepare() {
    cd "$srcdir/$_extracted"
    cmake \
        --warn-uninitialized \
        --warn-unused-vars \
        -S . -B build
}

build() {
    cmake \
        --build "$srcdir/$_extracted/build" \
        --config "$_cmake_config" \
        -j
}

check() {
    cd "$srcdir/$_extracted/build"
    ctest \
        --no-tests=ignore \
        --output-on-failure \
        --progress
}

package() {
    cmake \
        --install "$srcdir/$_extracted/build" \
        --prefix "$pkgdir/usr/" \
        --config "$_cmake_config"
}

