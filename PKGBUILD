# Maintainer: Blaadick <null>

pkgname="bstyle"
pkgdesc="Custom QML theme"
url="https://github.com/Blaadick/BStyle"
license=("GPL-3.0-only")
pkgver="1.0"
pkgrel=1
arch=("any")
depends=(
    "qt6-declarative"
)
makedepends=(
    "cmake"
    "ninja"
)
conflicts=("bstyle-git")
source=("bstyle-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ba881f802ae25f7a39df6570515db379fcc5786ea7c7b4d976bb66d506c7888259ba31b85da34777446767c71de32b9f529b19f8bbc0b4fef63e409194585f42')

build() {
    cd "BStyle-$pkgver"

    cmake -B cmake-build-release-linux -S . -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-w"
    cmake --build cmake-build-release-linux --parallel
}

package() {
    cd "BStyle-$pkgver"

    DESTDIR="$pkgdir" cmake --install cmake-build-release-linux
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
