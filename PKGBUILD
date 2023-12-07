# Maintainer: John <jboy (at) bius (.) moe>

pkgname=pandoc-sidenote
pkgrel=1
pkgv=0.23.0
pkgver=${pkgv}.0
pkgdesc="Pandoc filter for sidenotes"
url="https://hackage.haskell.org/package/${pkgname}"
license=("MIT")
arch=('x86_64')
provides=("pandoc-sidenote")
depends=('gmp' 'zlib')
makedepends=('stack')
https://github.com/jez/pandoc-sidenote/archive/refs/tags/0.23.0.tar.gz
source=("${pkgname}-${pkgv}.zip::https://github.com/jez/${pkgname}/archive/refs/tags/${pkgv}.tar.gz")
sha512sums=('0b69f11c3b7470243f5ed4ece0e9576492a413aa5c3838ea9fbc6d2875628f2358537d64d5fdd80a6fee266d0420ea67b696e32e30a0855d8a1438db528b2538')

pkgver() {
    cd "${srcdir}/${pkgname}-${pkgv}"
    echo $(grep version package.yaml | awk '{print $2}')
}

build() {
    cd "${srcdir}"/${pkgname}-${pkgv}
    stack build
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgv}
    install -Dm755 .stack-work/install/*/*/*/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
