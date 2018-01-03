pkgname=nlohmann-json
pkgver=3.0.1
pkgrel=1
pkgdesc="Header-only JSON library for Modern C++"
url="https://github.com/nlohmann/json"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nlohmann/json/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    mkdir -p "$srcdir/nlohmann-json-build"
    cd "$srcdir/nlohmann-json-build"
    
    cmake "$srcdir/json-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

check() {
    cd "$srcdir/nlohmann-json-build"
    ctest
}

package() {
    cd "$srcdir/nlohmann-json-build"
    make DESTDIR="$pkgdir" install
    install -Dm644 "$srcdir/json-$pkgver/LICENSE.MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
}
