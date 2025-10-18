# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-bluetooth
pkgver=2.2.3
pkgrel=1
pkgdesc='bluetooth provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-bluetooth')
provides=('elephant-bluetooth')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1ae87d7d20f7386690ddce8ca59043bf47d045839999de4eb4d109decf2c058')

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
