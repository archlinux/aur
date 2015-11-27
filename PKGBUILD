# $Id$
# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>
# Contributor: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=libomxil-component-audiotemplates
pkgver=0.1
pkgrel=1
pkgdesc="An opensource implementation of the OpenMAX Integration Layer API - AudioTemplates component"
arch=('i686' 'x86_64')
url="http://omxil.sourceforge.net"
license=('LGPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/omxil/components/libomxaudiotemplates-${pkgver}.tar.gz")
md5sums=('722a1d96d85bcce7a0e6b3218aa99209')

prepare() {
    cd ${srcdir}/libomxaudiotemplates-${pkgver}

    [ -f Makefile ] && make distclean
    patch -Np0 -i ../../libomxaudiotemplates_64bit.patch
    patch -Np0 -i ../../libomxaudiotemplates_write_fails.patch
    autoreconf -fiv
}

build() {
    cd ${srcdir}/libomxaudiotemplates-${pkgver}

    ./configure --prefix=/usr --disable-static
    make
}

package() {
    cd ${srcdir}/libomxaudiotemplates-${pkgver}

    make DESTDIR="${pkgdir}" install
}
