# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname=haskell-weeder
pkgver=1.0.8
pkgrel=1
pkgdesc="Detect dead exports or package imports"
arch=('x86_64')
url="https://github.com/ndmitchell/weeder"
license=('BSD')
makedepends=('git' 'stack')
source=("${pkgname}-${pkgver}::git://github.com/ndmitchell/weeder.git#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    stack init --ignore-subdirs
    stack build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    stack --local-bin-path "${pkgdir}/usr/bin/" install
}
