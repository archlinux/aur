# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>

pkgname=kurly
pkgver=1.2.0
pkgrel=1
pkgdesc='Kurly is an alternative to the widely popular curl program written in go.'
arch=('i686' 'x86_64' 'arm')
url='https://github.com/davidjpeacock/kurly'
license=('APACHE')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/davidjpeacock/kurly/archive/v${pkgver}.tar.gz")
sha512sums=('c6bbeae92f9f3743f67689d1f4d3fb19812964d3b274c1383e4b92866a5213593c4d41964363fb654b05a5f1bcb49a150734d08cc23a0774c2b66e1f28b88862')

build() {
    cd ${pkgname}-${pkgver}
   export GOPATH=$PWD
   export GOBIN=$GOPATH/build/bin
   go get ./...
    go build
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 -t "${pkgdir}"/usr/bin build/bin/${pkgname}-${pkgver}
    mv "${pkgdir}"/usr/bin/${pkgname}-${pkgver} "${pkgdir}"/usr/bin/${pkgname}
}
