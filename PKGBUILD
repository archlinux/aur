# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='loco-3d'
_pkgname='ndcurves'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=1.1.5
pkgrel=2
pkgdesc="Library for creating smooth cubic splines"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('hpp-fcl' 'eigenpy' 'pinocchio' 'python')
optdepends=('doxygen')
makedepends=('cmake' 'eigen')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('61a78ecafb8d6d5d33f2c3c262cf039a22cd73d156bffde5d3cdb0623ff04450'
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

package_ndcurves() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir/usr/share/doc"
}

package_ndcurves-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir"/usr/{lib,include,bin,"share/$_pkgname"}
}
