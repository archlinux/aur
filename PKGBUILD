# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>

pkgname=kurly
pkgver=1.0.0
pkgrel=1
pkgdesc='Kurly is an alternative to the widely popular curl program written in go.'
arch=('i686' 'x86_64' 'arm')
url='https://github.com/davidjpeacock/kurly'
license=('APACHE')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/davidjpeacock/kurly/archive/v${pkgver}.tar.gz")
sha512sums=('6b850a5e8c57d8b4d179e2e306653bb31b8d45c88b827bcef976aa510c0b094e111b0a6dfbd8cc4201e1e948c5938c27537a8d03123622e7914adb31425692d8')

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
