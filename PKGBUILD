# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Joël Schaerer <joel.schaerer at laposte.net>
# Contributor: Ľubomir 'The_K' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Robert Schwarz <mail@rschwarz.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>
# Contributor: Stephan Friedrichs <deduktionstheorem@googlemail.com>

pkgname=('scipoptsuite')
pkgver=6.0.2
pkgrel=5
pkgdesc='Toolbox for generating and solving optimization problems'
arch=('x86_64')
url='https://scip.zib.de'
license=('LGPL-3.0' 'custom:ZIB Academic License')
replaces=('ziboptsuite')
depends=('gmp' 'readline' 'zlib')
makedepends=('ninja' 'cmake' "${depends[@]}")
optdepends=('coin-or-ipopt: COIN-OR Interior Point Optimizer IPOPT'
            'gsl: GNU Scientific Library'
            'cliquer: C routines for finding cliques in an arbitrary weighted graph'
            'bliss: Library for computing automorphism groups and canonical forms of graphs'
            )
provides=('scip=6.0.2' 'soplex=4.0.2' 'zimpl=3.3.8')
source=("${url}/download/release/${pkgname}-${pkgver}.tgz")
md5sums=('6b2b6cacc43ba6776cc5018edabb0cc4')

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
# vim:set ts=2 sw=2 et: