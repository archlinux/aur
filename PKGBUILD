# $Id$
# Maintainer: Emanuel Couto <unit73e at gmail dot com>

pkgname=hdevtools
pkgver=0.1.8.0
pkgrel=1
pkgdesc="A backend for text editor plugins for Haskell"
url="https://github.com/hdevtools/hdevtools/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('ghc' 'haskell-cmdargs' 'haskell-system-filepath' 'haskell-ghc-paths'
         'haskell-network' 'haskell-syb')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2e6685a5c3fb97047997b0490623d1023cc7e2d7226e37e3e229f77968c03c98')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    runhaskell Setup configure -O --enable-executable-dynamic --prefix=/usr
    runhaskell Setup build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

