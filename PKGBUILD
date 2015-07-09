# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=xmonad-utils
pkgver=0.1.3.3
pkgrel=1
pkgdesc="A small collection of X utilities"
url="http://hackage.haskell.org/package/${pkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-x11>=1.3' 'haskell-random' 'haskell-unix' 'glibc')
depends=('gmp' 'glibc')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('d0ef4c556313f87c8311afd56a6e4ff9  ')
build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
