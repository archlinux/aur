# Maintainer: Ganyu_Genshin XianYuPigeon@outlook.com
pkgname=tempest-cli-bin
pkgver=3.18.0
pkgrel=1
pkgdesc="MCP CLI tool for AI-assisted remote access and automation (official binary)"
arch=('x86_64' 'aarch64')
url="https://gotempest.app"
license=('LicenseRef-proprietary')
depends=('systemd-libs' 'zlib')
provides=('tempest-cli')
conflicts=('tempest-cli')
options=('!strip' '!debug')
source_x86_64=("tempest-cli_${pkgver}-1_amd64.deb::https://download.gotempest.app/cli/tempest-cli_${pkgver}-1_amd64.deb")
# 上游公布值（SHA-256, hex）:
sha256sums_x86_64=('65a65ea4865a9a37c9c727f9007c3de6b32df74f8d92dc8dff392770bad1da62')

source_aarch64=("tempest-cli_${pkgver}-1_arm64.deb::https://download.gotempest.app/cli/tempest-cli_${pkgver}-1_arm64.deb")
# 上游公布值（SHA-256, hex）:
sha256sums_aarch64=('316cc6d1c45b561477bd687c71a6a85327edb4215aebc3d04e8bf8d2ed70e1b6')

package() {
    # .deb 已在解包阶段由 makepkg 用 bsdtar 展开, 这里只取 data.tar.* 装入 pkgdir
    bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
    # SPDX LicenseRef-* 标识要求随包附许可证文件（上游 deb 自带的 copyright 声明）
    install -Dm644 "$pkgdir/usr/share/doc/tempest-cli/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/copyright"
}
