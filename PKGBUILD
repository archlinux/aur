# Maintainer: kvunoff <kvunoff@proton.me>
pkgname=whoisthat
pkgver=0.11.5
pkgrel=2
pkgdesc="Modern terminal-based VPN client with Xray-core backend"
arch=('x86_64')
url="https://github.com/kvunoff/whoisthat"
license=('MIT')
depends=()
makedepends=('rust' 'go')
optdepends=('xray: system Xray-core binary (managed runtime used automatically if absent)'
            'tun2socks: system tun2socks binary (managed runtime used automatically if absent)')
install=whoisthat.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kvunoff/whoisthat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cd core/core
    go build -o whoisthat-core
    cd ../..

    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 target/release/whoisthat "${pkgdir}/usr/bin/whoisthat"
    install -Dm755 core/core/whoisthat-core  "${pkgdir}/usr/bin/whoisthat-core"
}
