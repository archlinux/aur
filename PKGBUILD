# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-bluetooth
pkgver=2.22.0
pkgrel=1
pkgdesc='bluetooth provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-bluetooth')
provides=('elephant-bluetooth')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c6caa61727e4b5c3981099943b4b616c338a6e1b4e33b5e1d32078b8e4dbe120')

build() {
    cd elephant-${pkgver}/internal/providers/bluetooth
    go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/bluetooth
    install -Dm 755 bluetooth.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
