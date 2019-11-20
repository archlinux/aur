# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=string-theory
_ghname=string_theory
pkgdesc='Flexible UTF-8 string library and type-safe formatter for C++'
pkgver=2.4
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/zrax/string_theory'
license=('MIT')
makedepends=('cmake')
source=("${_ghname}-${pkgver}.tar.gz::https://github.com/zrax/${_ghname}/archive/${pkgver}.tar.gz")
sha256sums=('b16251af19a36806a6908cc1f0caa528b5eb621900887cd5bddc638b637083cd')

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
