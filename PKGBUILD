# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=libgmxfort
pkgver=0.4.4
pkgrel=2
pkgdesc="A Fortran library for use in analyzing GROMACS simulation output files"
arch=(any)
url="https://github.com/wesbarnett/libgmxfort"
license=('GPL')
depends=('xdrfile')
source=(https://github.com/wesbarnett/${pkgname}/releases/download/${pkgver}/${pkgname}.${pkgver}.tar.gz{,.sig})
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha512sums=('f2da1ad2ca795b1dfa9cc0c31496a2ef5db99b3d586138d651daf86ae39ff27f2e2dd40a23518f05647447e5bc5aaf67141fee40d22687a4192b3a77322468bb'
            'SKIP')

prepare() {
    mkdir build
    cd build
    cmake "${srcdir}/${pkgname}"
}

build() {
    cd build
    make
}

check() {
    cd build
    make test
}

package() {
    cd build
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
