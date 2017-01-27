# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=string-theory
_ghname=string_theory
pkgdesc='Flexible UTF-8 string library and type-safe formatter for C++'
pkgver=1.4
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/zrax/string_theory'
license=('MIT')
makedepends=('cmake')
source=("${_ghname}-${pkgver}.tar.gz::https://github.com/zrax/${_ghname}/archive/${pkgver}.tar.gz")
sha256sums=('21bf616e970dbe9693b345987b04a1f92231e06f3b50691c76b5c020509f4cb5')

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
