# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=oxideterm-bin
_pkgname=OxideTerm
pkgver=1.4.3
pkgrel=1
pkgdesc="All-in-one terminal workspace — local shells, SSH, SFTP, remote IDE, AI agent, and file manager in a single native binary. Built with Tauri 2 and pure Rust SSH (no OpenSSL). Smart reconnect, MCP, RAG, plugins, 30+ themes, 11 languages.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://oxideterm.app/"
_ghurl="https://github.com/AnalyseDeCircuit/oxideterm"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x64.rpm")
sha256sums_aarch64=('fe2a4eb67a9e9f1275835440d6b9e43a37060e418744819def954d298fa6e866')
sha256sums_x86_64=('a0baa8e9415b72ed6e57425726fb58f290d3db801971dd40415a6d5e5f677318')
prepare() {
    sed -i "s/Categories=/Categories=Development;System;Utility;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/usr/lib/${_pkgname}/cli-bin/oxt" -t "${pkgdir}/usr/lib/${_pkgname}/cli-bin"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/agents/${pkgname%-bin}-agent-${CARCH}-linux-musl" -t "${pkgdir}/usr/lib/${_pkgname}/agents"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
