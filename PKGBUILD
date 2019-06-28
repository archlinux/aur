# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('libdecaf')
pkgver='1.0.0'
pkgrel=2
pkgdesc="A 448-bit Edwards curve"
url="https://sourceforge.net/projects/ed448goldilocks/"
depends=()
makedepends=('cmake' 'python')
license=('MIT')
arch=('x86_64')
source=("https://sourceforge.net/projects/ed448goldilocks/files/$pkgname-$pkgver.tgz"
    "fix-warnings.patch")
sha256sums=('a332d09731c9af9bef071ae7aa700a0ae59161bc94d78ace32fe21dd4c328d04'
            'a3618955de5972e388490c8f8ea1d46aac242bc148e2bd81bac56c9b1b4dcbad')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 < ../fix-warnings.patch
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib ..
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
