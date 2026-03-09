# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-windows
pkgver=2.20.1
pkgrel=1
pkgdesc='windows provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('fd')
makedepends=('go')
conflicts=('elephant-windows')
provides=('elephant-windows')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7d13c79cb9b57245ffb8a6272af953829e9ce91a4d82f45d534f029d15dcc628')

build() {
    cd elephant-${pkgver}/internal/providers/windows
    go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/windows
    install -Dm 755 windows.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
