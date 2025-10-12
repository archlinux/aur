# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-bluetooth
pkgver=2.1.4
pkgrel=1
pkgdesc='bluetooth provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-bluetooth')
provides=('elephant-bluetooth')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('50b5f97571878aa1a0e6cd348cc0352919e1c07744a696ef50073b8eee78afa1')

build() {
    cd elephant-${pkgver}/internal/providers/bluetooth
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/bluetooth
    install -Dm 755 bluetooth.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
