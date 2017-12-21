# Maintainer: Ľubomir 'The_K' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Robert Schwarz <mail@rschwarz.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>
# Contributor: Stephan Friedrichs <deduktionstheorem@googlemail.com>

pkgname=scipoptsuite
pkgver=4.0.1
pkgrel=3
pkgdesc="Toolbox for generating and solving optimization problems."
arch=('x86_64')
url='http://scip.zib.de'
license=('LGPL3' 'custom:ZIB Academic License')
replaces=('ziboptsuite')
depends=('gmp' 'readline' 'zlib')
makedepends=('bison' 'cmake' 'flex' "${depends[@]}")
provides=('scip=4.0.1' 'soplex=3.0.1' 'zimpl=3.3.4')
source=("http://scip.zib.de/download/release/${pkgname}-${pkgver}.tgz")
sha256sums=('72f2a0d79f3f8b615ad98fba6343d03ebbf644a6ba089ad6ad47577e189e2946')

build() {
    mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"

    cd "${srcdir}/${pkgname}-${pkgver}/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    make install DESTDIR="${pkgdir}"

    install -D -m644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
