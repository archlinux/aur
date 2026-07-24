_repoowner="xiaozhuai"
_reponame="imageinfo"

pkgname="imageinfo"
pkgdesc="Cross platform super fast single header c++ library to get image size and format without loading/decoding"
license=("MIT")
pkgver="2.0.0"
pkgrel=2
arch=("any")
makedepends=("cmake")
provides=("imageinfo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_repoowner/$_reponame/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("ab19e5d9e2add87f435a9cf73601cb90d5dac1ebdaca60f631a6bdb41dd5568d3aa057106273bbd1c5eda2fc5643548e275def7165498bcb69652eb0ee3db978")
url="https://github.com/$_repoowner/$_reponame"

build() {
    cd "$_reponame-$pkgver"

    cmake -B "cmake-build" -S . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DIMAGEINFO_BUILD_TOOLS=ON -DIMAGEINFO_BUILD_TESTS=OFF -DIMAGEINFO_BUILD_INSTALL=ON
    cmake --build "cmake-build" --parallel
}

package() {
    cd "$_reponame-$pkgver"

    DESTDIR="${pkgdir}" cmake --install "cmake-build"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
