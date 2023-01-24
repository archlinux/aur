# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=gepetto-viewer-corba
pkgver=5.7.3
pkgrel=1
pkgdesc="Graphical Interface for Pinocchio and HPP."
arch=('i686' 'x86_64')
url="https://github.com/gepetto/$pkgname"
license=('BSD')
depends=('gepetto-viewer' 'python-omniorbpy')
makedepends=('cmake' 'boost')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('79793619c55554be36b89ce348a0dd5bb84d6354363ca8b0ccc1bb2ffbae1f44'
            'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    install -Dm644 "$pkgbase-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
