# $Id$
# Maintainer: Emanuel Couto <unit73e at gmail dot com>

pkgname=hdevtools
pkgver=0.1.6.0
pkgrel=2
pkgdesc="A backend for text editor plugins for Haskell"
url="https://github.com/hdevtools/hdevtools/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('ghc' 'haskell-cmdargs' 'haskell-system-filepath' 'haskell-ghc-paths'
         'haskell-network' 'haskell-syb')
makedepends=('ghc')
source=('hdevtools::git+https://github.com/hdevtools/hdevtools.git#commit=bb167c2e09f0ae65968f9a2031de0ca6ea1eed95')
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"

    runhaskell Setup configure -O --enable-executable-dynamic --prefix=/usr
    runhaskell Setup build
}

package() {
    cd "${srcdir}/${pkgname}"

    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

