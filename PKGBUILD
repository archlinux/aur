# $Id$
# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>
# Contributor: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=libomxil-component-vorbis
pkgver=0.1
pkgrel=1
pkgdesc="An opensource implementation of the OpenMAX Integration Layer API - Vorbis component"
arch=('i686' 'x86_64')
url="http://omxil.sourceforge.net"
license=('LGPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/omxil/components/libomxvorbis-${pkgver}.tar.gz")
md5sums=('66039038637f634ab591095fae511e1c')

prepare() {
    cd ${srcdir}/libomxvorbis-${pkgver}

    [ -f Makefile ] && make distclean
    patch -Np0 -i ../../libomxvorbis_64bit.patch
    patch -Np0 -i ../../libomxvorbis_unused_variables.patch
    autoreconf -fiv
}

build() {
    cd ${srcdir}/libomxvorbis-${pkgver}

    ./configure --prefix=/usr --disable-static
    make
}

package() {
    cd ${srcdir}/libomxvorbis-${pkgver}

    make DESTDIR="${pkgdir}" install
}
