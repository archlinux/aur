# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nlohmann-json
pkgver=3.7.0
pkgrel=5
pkgdesc="Header-only JSON library for Modern C++"
url="https://github.com/nlohmann/json"
license=('MIT')
arch=('any') # check function needs a working compiler toolchain, but package really is arch independent 
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d51a3a8d3efbb1139d7608e28782ea9efea7e7933157e8ff8184901efd8ee760')

build() {
    cd json-$pkgver
    
    cmake "$srcdir"/json-$pkgver \
        -DBUILD_TESTING=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=/usr/lib
    make
}

package() {
    cd json-$pkgver
    make DESTDIR="$pkgdir" install
    install -Dm644 "$srcdir"/json-$pkgver/LICENSE.MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.MIT
}
