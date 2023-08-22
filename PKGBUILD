# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=maa-x-bin
pkgver=2.0.0_beta.13
pkgrel=1
pkgdesc="MAA GUI with Electron & Vue3"
arch=('aarch64' 'x86_64')
url="https://www.maa.plus/"
_githuburl="https://github.com/MaaAssistantArknights/MaaX"
license=("AGPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('at-spi2-core' 'libdrm' 'perl' 'glibc' 'libxrandr' 'libcups' 'gcc-libs' 'nss' 'python' 'bash' 'libxkbcommon' 'pango' 'libxcb' 'mesa' 'glib2' \
    'gtk3' 'nspr' 'expat' 'libxcomposite' 'libxdamage' 'libxext' 'alsa-lib' 'dbus' 'libx11' 'cairo' 'libxfixes')
makedepends=('gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-arm64-${pkgver//_/-}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-x64-${pkgver//_/-}.zip")
source=("${pkgname%-bin}.png::https://raw.githubusercontent.com/MaaAssistantArknights/MaaX/dev/packages/common/resources/icon.png")
sha256sums=('2920264f809b69ccb61be013538c2162154e6ee7fa3d27e748eec89b51315b5b')
sha256sums_aarch64=('57c6241eb81bf9d0ac24a5f58c47d1615696727efa3e49f492ae2dc4aed4bdf0')
sha256sums_x86_64=('7a7600cd9246a47ab13f587001d6773c09c4d4bf6f4170ce092962a0129a5f98')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux"-*/* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --categories "Utility" --name "Maa-X" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}