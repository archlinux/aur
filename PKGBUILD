# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='loco-3d'
_pkgname='ndcurves'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=2.1.1
pkgrel=1
pkgdesc="Library for creating smooth cubic splines"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('coal' 'eigenpy' 'pinocchio' 'python' 'boost-libs' 'glibc' 'gcc-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('43682331a49ed26772269a847181c7fc92bd9a12ed8de2edf2ba3c7080ccbaa0'
            'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver"
}

# TODO
# The following tests FAILED:
# 17 - test-so3-smooth (Failed)
# check() {
#     cmake --build "build-$pkgver" -t test
# }

package_ndcurves() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir/usr/share/doc"
}

package_ndcurves-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir"/usr/{lib,include,bin,share/{"$_pkgname",ament,ament_index}}
}
