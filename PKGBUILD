# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-bluetooth
pkgver=2.9.2
pkgrel=1
pkgdesc='bluetooth provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-bluetooth')
provides=('elephant-bluetooth')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab7c9a1bf2c6637d813c8d354bcfae79392b4a9103fdbc0819a702480001f7f3')

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
