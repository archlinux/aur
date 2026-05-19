# Maintainer: jinzhongjia <jinzhongjia@manus.ai>

pkgname=openwarp-bin
pkgver=2026.05.19.preview
_debver=2026.05.19.preview
pkgrel=1
# Upstream renamed releases from "YYYY.MM.DD.preview" to "0.YYYY.MM.DD.HHMM",
# which sorts lower under pacman vercmp. epoch ensures clean upgrades.
epoch=1
pkgdesc="OpenWarp - open-source fork of Warp, a Rust-based terminal with AI built in"
arch=('x86_64')
url="https://github.com/zerx-lab/warp"
license=('AGPL-3.0-only')
depends=(
    'alsa-lib'
    'dbus'
    'fontconfig'
    'libglvnd'
    'wayland'
    'libx11'
    'libxcb'
    'libxcursor'
    'libxi'
    'libxkbcommon-x11'
    'zlib'
)
optdepends=(
    'mesa: hardware-accelerated rendering'
    'adwaita-icon-theme: fallback icon theme'
    'python: bundled skill scripts (create-skill, pr-comments, feedback)'
    'python-yaml: skill validation script'
)
provides=('openwarp' 'warp-terminal-oss')
conflicts=('warp-terminal-oss')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/warp-terminal-oss_${_debver}_amd64.deb")
sha256sums=('1f40e9a78cfae8c729c95f03a5a82cf15ce9f8fe1d6d629c4777beacda389c44')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/warpdotdev/warp-terminal-oss/warp-oss "${pkgdir}/usr/bin/warp-terminal-oss"
    ln -s /opt/warpdotdev/warp-terminal-oss/warp-oss "${pkgdir}/usr/bin/openwarp"
}
