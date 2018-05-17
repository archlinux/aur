# Maintainer: John <jboy (at) bius (.) moe>

pkgname=pandoc-sidenote
pkgrel=1
pkgver=0.20.0.0
pkgdesc="Pandoc filter for sidenotes"
url="https://hackage.haskell.org/package/${pkgname}"
license=("MIT")
arch=('x86_64')
provides=("pandoc-sidenote")
depends=('gmp' 'zlib')
makedepends=('stack')
source=("${pkgname}-master.zip::https://github.com/jez/${pkgname}/archive/master.zip")
sha512sums=('f8fa19cb7beb5bcd5cc3098bac5e45e5b32fe6f60a5cf85cb01a089ccee0adc9d9350a6971f300e1c51b4d443873106733e3dc4b5412018a3a36bc0026ac31a7')

pkgver() {
    cd "${srcdir}"/${pkgname}-master
    echo $(grep version package.yaml | awk '{print $2}')
}

build() {
    cd "${srcdir}"/${pkgname}-master
    stack build
}

package() {
    cd "${srcdir}"/${pkgname}-master
    install -Dm755 .stack-work/install/*/*/*/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
