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
sha256sums=('8eaf92d8b01b46bcc0e42f0404de5ed9319c2c69d77803c8b7ec5f8a3d583ff4')

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
