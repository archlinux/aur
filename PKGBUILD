# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="backend-ai-desktop-bin"
pkgver=23.03.3
pkgrel=1
pkgdesc="Backend.AI Web UI provides a convenient environment for users, while allowing various commands to be executed without CLI. It also provides some visual features that are not provided by the CLI, such as dashboards and statistics."
arch=("aarch64" "x86_64")
url="https://www.backend.ai/"
_githuburl="https://github.com/lablup/backend.ai-webui"
license=('LGPL3')
depends=('electron25' 'hicolor-icon-theme')
makedepends=('asar' 'gendesk')
conflicts=("${pkgname%-bin}" "backend.ai" "backend.ai-desktop")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/v${pkgver}/backend.ai-desktop-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/v${pkgver}/backend.ai-desktop-${pkgver}-linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('5f9e1775b75bb437ad0948a058bd9e387e7e74166dc1db86222a2c3fbe7cb2c2')
sha256sums_aarch64=('ca33d5b121f513b68c69b76b93e7bbbf0d5c620f357d5a15a2f1216b9aeb79a7')
sha256sums_x86_64=('cfe446d8397d63e161451ae61c8aeae13d19a8f8bf46b894d5d5f323aedf389f')
package() {
    install -Dm644 "${srcdir}/Backend.AI Desktop-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    asar e "${pkgdir}/opt/${pkgname%-bin}/app.asar" "${srcdir}/tmp"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/tmp/app/manifest/${pkgname%-desktop-bin}.iconset/icon_${_icons}@1x.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Development" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}