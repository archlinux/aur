# Maintainer: Blaadick <null>

repoowner="Blaadick"
reponame="BStyle"
pkgname="bstyle-qml-theme"
pkgdesc="Style for QML applications"
license=("GPL-3.0-only")
pkgver="0.0.2"
pkgrel=1
arch=("any")
depends=("qt6-declarative")
makedepends=("cmake" "ninja")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$repoowner/$reponame/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("SKIP")
url="https://github.com/$repoowner/$reponame"
options=("!debug")

build() {
    cd "$reponame-$pkgver" || exit

    cmake -B cmake-build-release -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-w"
    cmake --build cmake-build-release --target bstyleplugin --parallel
}

package() {
    cd "$reponame-$pkgver" || exit

    cmake --install cmake-build-release
    install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
