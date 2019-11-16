# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Joël Schaerer <joel.schaerer at laposte.net>
# Contributor: Ľubomir 'The_K' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Robert Schwarz <mail@rschwarz.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>
# Contributor: Stephan Friedrichs <deduktionstheorem@googlemail.com>

pkgname=('scipoptsuite')
pkgver=6.0.2
pkgrel=1
pkgdesc="Toolbox for generating and solving optimization problems"
arch=('x86_64')
url="https://scip.zib.de"
license=('LGPL3' 'custom:ZIB Academic License')
replaces=('ziboptsuite')
depends=('gmp' 'readline' 'zlib')
makedepends=('ninja' 'bison' 'cmake' 'flex' "${depends[@]}")
optdepends=('coin-or-ipopt: COIN-OR Interior Point Optimizer IPOPT'
            'gsl: GNU Scientific Library'
            'cliquer: C routines for finding cliques in an arbitrary weighted graph'
            'bliss: Library for computing automorphism groups and canonical forms of graphs'
            )
provides=('scip=6.0.2' 'soplex=4.0.2' 'zimpl=3.3.8')
source=("${url}/releases/download/v${pkgver}/gkill-linux-386")
sha512sums=('20e07b4e916473d01804c25a04b9a3d97b2ac1be54ea62d81a77dda262281b39cd0666e30772e9d82c9c4cf18edcf80c3b864d3085ce51ac022c769ee5a2e730')
# source=("$url/download/release/$pkgname-$pkgver.tgz")
sha256sums=('e25329a2ed4fbdde8a32279a4c955ee7a8b8795429b6e7105ae17998c2ecbe66')

build() {
  mkdir -p "$srcdir/$pkgname-$pkgver/build"
  cd "$srcdir/$pkgname-$pkgver/build"
  cmake -G Ninja -DCMAKE_INSTALL_PREFIX=/usr ..
  ninja
}

check() {
  cd "$srcdir/$pkgname-$pkgver/build"
  ninja check
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  DESTDIR="$pkgdir" ninja install
  install -D -m644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
