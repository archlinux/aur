# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-bluetooth
pkgver=2.6.0
pkgrel=1
pkgdesc='bluetooth provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-bluetooth')
provides=('elephant-bluetooth')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8a42650417463b63614975fe9ec897a8f6b893561639dcbd1ccaa81390eab670')

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
