# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=idris
pkgver=0.9.20.2
pkgrel=1
pkgdesc="Functional Programming Language with Dependent Types"
url="http://www.idris-lang.org/"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc' 'cabal-install')
depends=('gmp' 'libffi' 'zlib' 'gcc')
provides=('idris')
conflicts=('idris-git')
source=(http://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('7bf368fd7d64ca974744fe9ed2547903')
build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    cabal sandbox init
    cabal install --only-dependencies -fFFI -fGMP
    cabal configure -O --prefix=/usr -fFFI -fGMP

    cabal build
}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cabal copy --destdir=${pkgdir}
    rm -r ${pkgdir}/usr/lib
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
    install -D -m644 man/${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
