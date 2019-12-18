# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='gepetto'
pkgname=('example-robot-data' 'example-robot-data-docs')
pkgver=3.1.1
pkgrel=1
pkgdesc="Set of robot URDFs for benchmarking and developed examples. "
arch=('any')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('pinocchio')
optdepends=('doxygen')
makedepends=('cmake')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

build() {
    mkdir -p "$pkgbase-$pkgver/build"
    cd "$pkgbase-$pkgver/build"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
    make
}

check() {
    cd "$pkgbase-$pkgver/build"
    make test
}

package_example-robot-data() {
    cd "$pkgbase-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    rm -rf $pkgdir/usr/share/doc
}

package_example-robot-data-docs() {
    cd "$pkgbase-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    rm -rf $pkgdir/usr/{lib,include}
}
