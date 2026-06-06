pkgname=linktui
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI for managing WiFi, Bluetooth and VPN connections on Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/austinemk/linktui"
license=('MIT')
depends=('networkmanager' 'bluez')
makedepends=('go')
provides=('linktui')
conflicts=('linktui-bin' 'linktui-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/austinemk/linktui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    go build -ldflags="-s -w" -o linktui .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 linktui "$pkgdir/usr/bin/linktui"
}
