# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('ecos')
pkgver='2.0.7'
pkgrel=1
pkgdesc="A lightweight conic solver for second-order cone programming."
url="https://www.embotech.com/ECOS"
depends=()
makedepends=()
license=('GPL3')
arch=('x86_64')
source=("https://github.com/embotech/ecos/archive/${pkgver}.tar.gz")
sha256sums=('bdb6a84f7d150820459bd0a796cb64ffbb019afb95dc456d22acc2dafb2e70e0')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s/\(^\$(SHAREDNAME):.*\)/\1 \$(ECOS_BB_OBJS)/g" Makefile
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make shared
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D libecos.so "${pkgdir}/usr/lib/libecos.so"
    install -d "${pkgdir}/usr/include/ecos"
    install -D -m644 include/*.h "${pkgdir}/usr/include/ecos/"
}
