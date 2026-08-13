# Maintainer: Julian Corbet <julian-corbet@users.noreply.github.com>
pkgname=dotkeeper-bin
pkgver=1.2.9
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
sha256sums_x86_64=('19351c5e74ff028d269843cdcc6364725fcc314b34d60c16ab53acac6f29ba13')
sha256sums_aarch64=('d06fafdffe5e7aaf1795a6e2ced9e05096eccf8134ccb2bdb8eb83732639c329')

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
