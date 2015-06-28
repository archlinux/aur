# Maintainer: serkho <sergey.khorev@gmail.com>
_hkgname=hothasktags
pkgname=hothasktags
pkgver=0.3.1
pkgrel=1
pkgdesc="Generates ctags for Haskell, incorporating import lists and qualified imports"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-containers' 'haskell-cpphs' 'haskell-filepath' 'haskell-haskell-src-exts')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('e4cde70444b03fc8e69cd4d326680351')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    sed -i hothasktags.cabal -e 's/^\(\s\+cpphs\).*/\1/'
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
