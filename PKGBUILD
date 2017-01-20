# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgbase=('ecos')
pkgname=('ecos')
pkgver='2.0.5'
pkgrel=1
pkgdesc="A lightweight conic solver for second-order cone programming."
url="https://www.embotech.com/ECOS"
depends=()
makedepends=()
license=('GPL3')
arch=('i686' 'x86_64')
source=("https://github.com/embotech/ecos/archive/v${pkgver}.tar.gz")
sha256sums=('14c6ef81dfe9dad6af353e3499ad3a7a0eb1ebd289a995b038e3bc67c6101151')

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
