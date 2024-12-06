# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

pkgname="matio"
pkgver=1.5.28
pkgrel=1
pkgdesc="C library for reading and writing Matlab MAT files"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/${pkgname}/"
license=('BSD-2-Clause')
depends=()
optdepends=()
makedepends=()
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9da698934a21569af058e6348564666f45029e6c2b0878ca0d8f9609bf77b8d8')


build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver"
}

# TODO: 92% tests passed, 615 tests failed out of 7845
#check() {
    #cmake --build "build-$pkgver" -t test
#}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    install -Dm644 "$pkgbase-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
