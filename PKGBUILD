# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>

pkgname=kurly
pkgver=1.1.0
pkgrel=1
pkgdesc='Kurly is an alternative to the widely popular curl program written in go.'
arch=('i686' 'x86_64' 'arm')
url='https://github.com/davidjpeacock/kurly'
license=('APACHE')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/davidjpeacock/kurly/archive/v${pkgver}.tar.gz")
sha512sums=('7c39915bfb9c8c2c6d49c82e6a8095dfae3c4fea9b8b956a05ed09cdfe000ca60aa237a2a099f865ecd2ed28189bccc214c0598745ecedebc619ee981008ba9e')

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
