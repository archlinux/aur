# Maintainer: Blaadick <null>

_architectures=("i686-w64-mingw32" "x86_64-w64-mingw32")

pkgname="mingw-w64-libde265"
pkgver="1.0.18"
pkgrel=1
pkgdesc="Open h.265 video codec implementation (mingw-w64)"
arch=("any")
url="https://github.com/strukturag/libde265"
license=("LGPL3")
depends=("mingw-w64-crt")
makedepends=("mingw-w64-cmake")
options=("!buildflags" "staticlibs" "!strip")
source=("https://github.com/strukturag/libde265/releases/download/v$pkgver/libde265-$pkgver.tar.gz")
sha256sums=("800478f3bf35f0621b14928ceb317579f3e8b23de4bd2aac29b6cb8be962bbd8")

build() {
    cd "libde265-$pkgver"

    for _arch in ${_architectures[@]}; do
        $_arch-cmake \
            -B "build-$_arch" \
            -S . \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_POLICY_VERSION_MINIMUM=3.5

        cmake --build "build-$_arch" --parallel
    done
}

package () {
    cd "libde265-$pkgver"

    for _arch in ${_architectures[@]}; do
        cmake --install "build-$_arch" --prefix "$pkgdir/usr/$_arch"
    done
}
