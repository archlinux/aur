# Maintainer: Jennifer Lewis <jennyfirr@proton.me>
pkgname=foxlib
pkgver=0.1.0
pkgrel=1
pkgdesc='Header-only C++20 library for branchless fixed-point tick processing'
arch=('any')
url='https://github.com/Jennyfirrr/FoxLIB'
license=('MIT')
makedepends=('cmake')
optdepends=('openssl: for websocket header')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cmake -B build -S "FoxLIB-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DFOXLIB_BUILD_TESTS=OFF
}

check() {
    cmake -B build-check -S "FoxLIB-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DFOXLIB_BUILD_TESTS=ON
    cmake --build build-check
    ./build-check/foxlib_test
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "FoxLIB-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
