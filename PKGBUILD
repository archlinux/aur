pkgname=linktui-git
pkgver=r1.6822bd2
pkgrel=1
pkgdesc="A TUI for managing WiFi, Bluetooth and VPN connections on Linux (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/austinemk/linktui"
license=('MIT')
depends=('networkmanager' 'bluez')
makedepends=('go' 'git')
provides=('linktui')
conflicts=('linktui' 'linktui-bin')
source=("${pkgname}::git+https://github.com/austinemk/linktui.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    export CGO_ENABLED=0
    go build -ldflags="-s -w" -o linktui .
}

package() {
    cd "${pkgname}"
    install -Dm755 linktui "$pkgdir/usr/bin/linktui"
}
