# $Id$
# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>
# Contributor: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=libomxil-component-xvideo
pkgver=0.1
pkgrel=1
pkgdesc="An opensource implementation of the OpenMAX Integration Layer API - XVideo component"
arch=('i686' 'x86_64')
url="http://omxil.sourceforge.net"
license=('LGPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/omxil/components/libomxxvideo-${pkgver}.tar.gz")
md5sums=('853c9892f68a14c9a3ff94148701de60')

prepare() {
    cd ${srcdir}/libomxxvideo-${pkgver}

    [ -f Makefile ] && make distclean
    patch -Np0 -i ../../libomxxvideo_64bit.patch
    autoreconf -fiv
}

build() {
    cd ${srcdir}/libomxxvideo-${pkgver}

    ./configure --prefix=/usr --disable-static
    make
}

package() {
    cd ${srcdir}/libomxxvideo-${pkgver}

    make DESTDIR="${pkgdir}" install
}
