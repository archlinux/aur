# $Id$
# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>
# Contributor: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=libomxil-component-fbdevsink
pkgver=0.1
pkgrel=2
pkgdesc="An opensource implementation of the OpenMAX Integration Layer API - FBdevSink component"
arch=('i686' 'x86_64')
url="http://omxil.sourceforge.net"
license=('LGPL')
depends=('glibc' 'libomxil-bellagio')
source=("https://downloads.sourceforge.net/project/omxil/components/libomxfbdevsink-${pkgver}.tar.gz")
md5sums=('6a6a452bd8c9c4fb64f7913ba0884732')

prepare() {
    cd ${srcdir}/libomxfbdevsink-${pkgver}

    [ -f Makefile ] && make distclean
    patch -Np0 -i ../../libomxfbdevsink_64bit.patch
    autoreconf -fiv
}

build() {
    cd ${srcdir}/libomxfbdevsink-${pkgver}

    ./configure --prefix=/usr
    make
}

package() {
    cd ${srcdir}/libomxfbdevsink-${pkgver}

    make DESTDIR="${pkgdir}" install
}
