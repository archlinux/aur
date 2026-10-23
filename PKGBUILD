# Maintainer: Blaadick <null>

pkgname="bstyle-git"
pkgdesc="Custom QML theme (latest commit from master)"
url="https://github.com/Blaadick/BStyle"
license=("GPL-3.0-only")
pkgver="1.0.r0.g4a60434"
pkgrel=1
arch=("any")
depends=(
    "qt6-declarative"
)
makedepends=(
    "git"
    "cmake"
    "ninja"
)
provides=("bstyle")
conflicts=("bstyle")
source=("bstyle::git+$url.git")
sha512sums=("SKIP")

pkgver() {
    cd "bstyle"

    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "bstyle"

    cmake -B cmake-build-release-linux -S . -G Ninja -DCMAKE_BUILD_TYPE=Release
    cmake --build cmake-build-release-linux --parallel
}

package() {
    cd "bstyle"

    DESTDIR="$pkgdir" cmake --install cmake-build-release-linux
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
