# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='loco-3d'
_pkgname='ndcurves'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=1.1.1
pkgrel=1
pkgdesc="Library for creating smooth cubic splines"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('hpp-fcl' 'eigenpy' 'pinocchio' 'python')
optdepends=('doxygen')
makedepends=('cmake' 'eigen')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver"
}

package_ndcurves() {
    export DESTDIR="$pkgdir/"
    cmake --build "build-$pkgver"
    rm -rf "$pkgdir/usr/share/doc"
}

package_ndcurves-docs() {
    export DESTDIR="$pkgdir/"
    cmake --build "build-$pkgver"
    rm -rf "$pkgdir"/usr/{lib,include,bin,"share/$_pkgname"}
}
