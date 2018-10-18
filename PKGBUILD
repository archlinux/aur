# Maintainer Joël Schaerer <joel.schaerer at laposte.net>
# Contributor: Ľubomir 'The_K' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Robert Schwarz <mail@rschwarz.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>
# Contributor: Stephan Friedrichs <deduktionstheorem@googlemail.com>

pkgname=scipoptsuite
pkgver=6.0.0
pkgrel=1
pkgdesc="Toolbox for generating and solving optimization problems."
arch=('x86_64')
url='http://scip.zib.de'
license=('LGPL3' 'custom:ZIB Academic License')
replaces=('ziboptsuite')
depends=('gmp' 'readline' 'zlib')
makedepends=('ninja' 'bison' 'cmake' 'flex' "${depends[@]}")
provides=('scip=4.0.1' 'soplex=3.0.1' 'zimpl=3.3.4')
source=("http://scip.zib.de/download/release/${pkgname}-${pkgver}.tgz")
sha256sums=('a91119687e521575070c43eaa30bc15ce461e9dc414651793ea4c4ca33b89750')

build() {
    mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    cmake -G Ninja -DCMAKE_INSTALL_PREFIX=/usr ..
    ninja
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    ninja check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    DESTDIR="${pkgdir}" ninja install
    install -D -m644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
