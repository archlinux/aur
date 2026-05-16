# Maintainer: Julian Corbet <admin+aur@sys.corbet.ch>
pkgname=dotkeeper-bin
pkgver=0.8.0
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
sha256sums_x86_64=('31f43aefaf859ae11a4a40c2074470199204684eca59beab91f06f1a8eefda80')
sha256sums_aarch64=('4a364f312b775b9efac21785b3f9b4485b14c9a7b49dd5fe491e81ccb1322061')

package() {
    local _arch
    [ "$CARCH" = "x86_64" ] && _arch="amd64" || _arch="arm64"
    cd "${srcdir}/dotkeeper_${pkgver}_linux_${_arch}"
    install -Dm755 dotkeeper "${pkgdir}/usr/bin/dotkeeper"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 repo-config.toml "${pkgdir}/usr/share/doc/${pkgname}/repo-config.toml"
    install -Dm644 home-manager-denylist.nix "${pkgdir}/usr/share/doc/${pkgname}/home-manager-denylist.nix"
}
