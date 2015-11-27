# $Id$
# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>
# Contributor: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=libomxil-component-mad
pkgver=0.1
pkgrel=1
pkgdesc="An opensource implementation of the OpenMAX Integration Layer API - MAD component"
arch=('i686' 'x86_64')
url="http://omxil.sourceforge.net"
license=('LGPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/omxil/components/libomxmad-${pkgver}.tar.gz")
md5sums=('b2e398ef611b628ffc7c38a0accff2a6')

prepare() {
    cd ${srcdir}/libomxmad-${pkgver}

    [ -f Makefile ] && make distclean
    patch -Np0 -i ../../libomxmad_64bit.patch
    autoreconf -fiv
}

build() {
    cd ${srcdir}/libomxmad-${pkgver}

    ./configure --prefix=/usr --disable-static
    make
}

package() {
    cd ${srcdir}/libomxmad-${pkgver}

    make DESTDIR="${pkgdir}" install
}
