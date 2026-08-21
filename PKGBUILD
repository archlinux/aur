# Maintainer: slatkin@woims.net
pkgname=mbv
pkgver=0.17.12
pkgrel=1
pkgdesc="Terminal client for Emby media server"
arch=('x86_64')
url="https://github.com/slatkin/mbv"
license=('MIT')
depends=('mpv' 'openssl')
optdepends=('cava: audio visualizer support')
source=("${pkgname}-${pkgver}-linux-x86_64.tar.gz::https://github.com/slatkin/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('8be87e11822b151cb59b57c6bd6e620fdacacdac7ce9088ffa1796b64998b0e7')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "mbvd" "${pkgdir}/usr/bin/mbvd"
    install -Dm644 "mbv.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "mbv.lua" "${pkgdir}/usr/share/${pkgname}/scripts/mbv.lua"
    for script in mbv_*.lua; do
        install -Dm644 "${script}" "${pkgdir}/usr/share/${pkgname}/scripts/${script}"
    done
    install -Dm644 "Material-Design-Iconic-Font.ttf" \
        "${pkgdir}/usr/share/${pkgname}/fonts/Material-Design-Iconic-Font.ttf"
    install -Dm644 "config.toml" "${pkgdir}/usr/share/${pkgname}/config.toml"
    install -Dm640 "mbvd.toml" "${pkgdir}/etc/mbv/config.toml"
    install -Dm644 "mbvd.service" "${pkgdir}/usr/lib/systemd/system/mbvd.service"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
