# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant
pkgver=2.19.0
pkgrel=1
pkgdesc='general purpose datasource and executor'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant')
provides=('elephant')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('473f5f7e3fe35d2444696c48e8e8aa8a362a15c66f31c88afdaa8e6409522bd2')

build() {
    cd ${pkgname}-${pkgver}/cmd/elephant
    go build -ldflags="-s -w" -buildvcs=false -x -o elephant -trimpath
}

package() {
    cd ${pkgname}-${pkgver}/cmd/elephant
    install -Dm 755 elephant -t "${pkgdir}/usr/bin"

    cd ../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
