# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=string-theory
_ghname=string_theory
pkgdesc='Flexible UTF-8 string library and type-safe formatter for C++'
pkgver=3.7
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/zrax/string_theory'
license=('MIT')
makedepends=('cmake')
source=("https://github.com/zrax/${_ghname}/releases/download/${pkgver}/${_ghname}-${pkgver}.tar.gz")
sha256sums=('164744cc68d1f7d1eb77585e2801616d59b6f3d7f495816e736d90fdfa2ce216')

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
