# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=string-theory
_ghname=string_theory
pkgdesc='Flexible UTF-8 string library and type-safe formatter for C++'
pkgver=3.8
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/zrax/string_theory'
license=('MIT')
makedepends=('cmake')
source=("https://github.com/zrax/${_ghname}/releases/download/${pkgver}/${_ghname}-${pkgver}.tar.gz")
sha256sums=('2b43daf9424e3136327e71b70abe0b15d51427653778df7b149574ef1dfec890')

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
