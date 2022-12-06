# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Médéric Boquien <mboquien at free dot fr>

pkgname=wcstools-all
_pkgname=wcstools
pkgver=3.9.7
pkgrel=2
pkgdesc="A package of programs for setting and using the world coordinate systems (including libs and headers)"
arch=('i686' 'x86_64')
url="http://tdc-www.harvard.edu/wcstools/"
license=('GPL2')
depends=('glibc')
options=('makeflags')
conflicts=('wcstools')
provides=('wcstools')
source=("http://tdc-www.harvard.edu/software/wcstools/${_pkgname}-${pkgver}.tar.gz"
        'wcstools-rename-shlib.patch')
md5sums=('2567b491887b6c4143417d627863d0a4'
         'dbb6a84dbf818e6a35a71d798d3e7e36')

prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    patch -Np1 -i "${srcdir}/wcstools-rename-shlib.patch"
}

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    make all || return 1
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    install -Dm755 -t "${pkgdir}/usr/bin" bin/*
    install -Dm644 -t "${pkgdir}/usr/include/wcs" libwcs/*.h
    install -Dm644 -t "${pkgdir}/usr/share/man/man1" man/man1/*
    install -d "${pkgdir}/usr/lib"
    cp -a libwcs/*.so* "${pkgdir}/usr/lib"
}
