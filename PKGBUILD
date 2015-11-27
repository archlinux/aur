# $Id$
# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>
# Contributor: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=libomxil-component-camera
pkgver=0.1
pkgrel=1
pkgdesc="An opensource implementation of the OpenMAX Integration Layer API - Camera component"
arch=('i686' 'x86_64')
url="http://omxil.sourceforge.net"
license=('LGPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/omxil/components/libomxcamera-${pkgver}.tar.gz")
md5sums=('01b61cf925b6240cc3345025aa4d54b9')

prepare() {
    cd ${srcdir}/libomxcamera-${pkgver}

    [ -f Makefile ] && make distclean
    patch -Np0 -i ../../libomxcamera_64bit.patch
    autoreconf -fiv
}

build() {
    cd ${srcdir}/libomxcamera-${pkgver}

    ./configure --prefix=/usr --disable-static
    make
}

package() {
    cd ${srcdir}/libomxcamera-${pkgver}

    make DESTDIR="${pkgdir}" install
}
