# $Id$
# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>
# Contributor: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=libomxil-component-jpeg
pkgver=0.1
pkgrel=1
pkgdesc="An opensource implementation of the OpenMAX Integration Layer API - JPEG component"
arch=('i686' 'x86_64')
url="http://omxil.sourceforge.net"
license=('LGPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/omxil/components/libomxjpeg-${pkgver}.tar.gz")
md5sums=('4985931601103c65b915c9ed0b82a695')

prepare() {
    cd ${srcdir}/libomxjpeg-${pkgver}

    [ -f Makefile ] && make distclean
    patch -Np0 -i ../../libomxjpeg_64bit.patch
    autoreconf -fiv
}

build() {
    cd ${srcdir}/libomxjpeg-${pkgver}

    ./configure --prefix=/usr --disable-static
    make
}

package() {
    cd ${srcdir}/libomxjpeg-${pkgver}

    make DESTDIR="${pkgdir}" install
}
