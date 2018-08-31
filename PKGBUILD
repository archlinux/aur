# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('libdecaf')
pkgver='1.0.0'
pkgrel=1
pkgdesc="A 448-bit Edwards curve"
url="https://sourceforge.net/projects/ed448goldilocks/"
depends=()
makedepends=('cmake')
license=('MIT')
arch=('x86_64')
source=("https://sourceforge.net/projects/ed448goldilocks/files/$pkgname-$pkgver.tgz")
sha256sums=('a332d09731c9af9bef071ae7aa700a0ae59161bc94d78ace32fe21dd4c328d04')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make test
}
