# $Id$
# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>
# Contributor: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=libomxil-component-videosrc
pkgver=0.1
pkgrel=1
pkgdesc="An opensource implementation of the OpenMAX Integration Layer API - VideoSrc component"
arch=('i686' 'x86_64')
url="http://omxil.sourceforge.net"
license=('LGPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/omxil/components/libomxvideosrc-${pkgver}.tar.gz")
md5sums=('60ba58340f2e1e2056abc1d54e298cc0')

prepare() {
    cd ${srcdir}/libomxvideosrc-${pkgver}

    [ -f Makefile ] && make distclean
    patch -Np0 -i ../../libomxvideosrc_64bit.patch
    patch -Np0 -i ../../libomxvideosrc_unused_variables.patch
    autoreconf -fiv
}

build() {
    cd ${srcdir}/libomxvideosrc-${pkgver}

    ./configure --prefix=/usr --disable-static
    make
}

package() {
    cd ${srcdir}/libomxvideosrc-${pkgver}

    make DESTDIR="${pkgdir}" install
}
