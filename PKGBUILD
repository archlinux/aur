# $Id$
# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>
# Contributor: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=libomxil-component-alsa
pkgver=0.1
pkgrel=1
pkgdesc="An opensource implementation of the OpenMAX Integration Layer API - ALSA component"
arch=('i686' 'x86_64')
url="http://omxil.sourceforge.net"
license=('LGPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/omxil/components/libomxalsa-${pkgver}.tar.gz")
md5sums=('39273f12cc916f70b1758244cf8e61c4')

prepare() {
    cd ${srcdir}/libomxalsa-${pkgver}

    [ -f Makefile ] && make distclean
    patch -Np0 -i ../../libomxalsa_64bit.patch
    autoreconf -fiv
}

build() {
    cd ${srcdir}/libomxalsa-${pkgver}

    ./configure --prefix=/usr --disable-static
    make
}

package() {
    cd ${srcdir}/libomxalsa-${pkgver}

    make DESTDIR="${pkgdir}" install
}
