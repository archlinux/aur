# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='loco-3d'
_pkgname='ndcurves'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=1.4.1
pkgrel=2
pkgdesc="Library for creating smooth cubic splines"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('hpp-fcl' 'eigenpy' 'pinocchio' 'python' 'boost-libs' 'glibc' 'gcc-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('13f7806a4bfe70d2fe6a1ab3360bbb11309350bd6de0ac363a98cc167f87af36'
            'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
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
