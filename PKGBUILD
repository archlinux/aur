# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgbase=('ecos')
pkgname=('ecos')
pkgver='2.0.6'
pkgrel=1
pkgdesc="A lightweight conic solver for second-order cone programming."
url="https://www.embotech.com/ECOS"
depends=()
makedepends=()
license=('GPL3')
arch=('x86_64')
source=("https://github.com/embotech/ecos/archive/v${pkgver}.tar.gz")
sha256sums=('ffc4b44e813a5c68abd464b638d216f09385d9b6e40cf487ac384289e6a27988')

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
