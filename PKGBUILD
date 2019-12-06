# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('libdecaf')
pkgver='1.0.0'
pkgrel=3
pkgdesc="A 448-bit Edwards curve"
url="https://sourceforge.net/projects/ed448goldilocks/"
depends=()
makedepends=('cmake' 'git' 'python')
license=('MIT')
arch=('x86_64')
source=("libdecaf-1.0.0::git+git://git.code.sf.net/p/ed448goldilocks/code"
    "cmake.patch")
sha256sums=('SKIP'
            '9b723855f1f86889a2f78257adab619e6787ca1439f3aa8af7b81cb842b93f8d')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 < ../cmake.patch
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_STATIC=OFF \
    -DENABLE_TESTS=ON ..
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
