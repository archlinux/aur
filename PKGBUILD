# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nlohmann-json
pkgver=3.7.1
pkgrel=1
pkgdesc="Header-only JSON library for Modern C++"
url="https://github.com/nlohmann/json"
license=('MIT')
arch=('any') # check function needs a working compiler toolchain, but package really is arch independent 
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e25cf46631f1a3200d109ca33a683b84538411170ee99cd181db8089a2513189')

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
