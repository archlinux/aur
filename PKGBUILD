# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=string-theory
_ghname=string_theory
pkgdesc='Flexible UTF-8 string library and type-safe formatter for C++'
pkgver=3.9
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/zrax/string_theory'
license=('MIT')
makedepends=('cmake')
source=("https://github.com/zrax/${_ghname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9bb0a9697319964479f813d9c61e3c5a1f57f7e8a5bc6db14cba7489addc3f49')

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          "${srcdir}/${_ghname}-${pkgver}"

    make
}

check() {
    cd "${srcdir}/build"
    make test
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
