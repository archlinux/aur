# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=maa-x-bin
pkgver=2.0.0_beta.14
pkgrel=2
pkgdesc="MAA GUI with Electron & Vue3"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.maa.plus/"
_ghurl="https://github.com/MaaAssistantArknights/MaaX"
license=("AGPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'at-spi2-core'
    'libdrm'
    'perl'
    'libxrandr'
    'libcups'
    'nss'
    'python'
    'bash'
    'libxkbcommon'
    'pango'
    'libxcb'
    'mesa'
    'glib2'
    'gtk3'
    'nspr'
    'expat'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'alsa-lib'
    'dbus'
    'libx11'
    'cairo'
    'libxfixes'
)
makedepends=('gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-arm64-${pkgver//_/-}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-x64-${pkgver//_/-}.zip")
source=("${pkgname%-bin}.png::https://raw.githubusercontent.com/MaaAssistantArknights/MaaX/v${pkgver//_/-}/packages/common/resources/icon.png")
sha256sums=('2920264f809b69ccb61be013538c2162154e6ee7fa3d27e748eec89b51315b5b')
sha256sums_aarch64=('d0a59e9b51e9087fe5ed4a26255bb55cf8a7c373bbfba0b22b76b2249e50f171')
sha256sums_x86_64=('fd314076dab798f9121002d1f06fc514253c39614b4bbe3a5844cab8182d2953')
build() {
    gendesk -f -n -q --categories "Game" --name "Maa-X" --exec "${pkgname%-bin} --no-sandbox %U"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux"-*/* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}