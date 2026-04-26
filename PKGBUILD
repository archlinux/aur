# Maintainer: Julian Corbet <julian.corbet@gmail.com>
pkgname=dotkeeper-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="P2P file sync with git history — embedded Syncthing + staggered git auto-backup"
arch=('x86_64' 'aarch64')
url="https://dotkeeper.corbet.ch"
license=('AGPL-3.0-only')
depends=('git')
provides=('dotkeeper')
conflicts=('dotkeeper' 'dotkeeper-git')
source_x86_64=("dotkeeper_${pkgver}_linux_amd64.tar.gz::https://github.com/julian-corbet/dotkeeper/releases/download/v${pkgver}/dotkeeper_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("dotkeeper_${pkgver}_linux_arm64.tar.gz::https://github.com/julian-corbet/dotkeeper/releases/download/v${pkgver}/dotkeeper_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9bb7ef9b9c41f82bdd82fae1e708253e266d1b6a2774254d3960f9c3fd23896e')
sha256sums_aarch64=('0202f5589e69697cbf61416f6a1ded8b85de9bd9ade51f36c38b1f1bff1a5073')

package() {
    local _arch
    [ "$CARCH" = "x86_64" ] && _arch="amd64" || _arch="arm64"
    cd "${srcdir}/dotkeeper_${pkgver}_linux_${_arch}"
    install -Dm755 dotkeeper "${pkgdir}/usr/bin/dotkeeper"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 dotkeeper.toml.example "${pkgdir}/usr/share/doc/${pkgname}/dotkeeper.toml.example"
}
