# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=maa-x-bin
pkgver=2.0.0_beta.12
pkgrel=2
pkgdesc="MAA GUI with Electron & Vue3"
arch=('aarch64' 'x86_64')
url="https://www.maa.plus/"
_githuburl="https://github.com/MaaAssistantArknights/MaaX"
license=("AGPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('at-spi2-core' 'libdrm' 'perl' 'glibc' 'libxrandr' 'libcups' 'gcc-libs' 'nss' 'python' 'bash' 'libxkbcommon' 'pango' 'libxcb' 'mesa' 'glib2' \
    'gtk3' 'nspr' 'expat' 'libxcomposite' 'nodejs' 'libxdamage' 'libxext' 'alsa-lib' 'dbus' 'libx11' 'cairo' 'libxfixes')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.zip")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-arm64-${pkgver//_/-}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-x64-${pkgver//_/-}.zip")
source=("${pkgname%-bin}.png::https://raw.githubusercontent.com/MaaAssistantArknights/MaaX/dev/packages/common/resources/icon.png")
sha256sums=('2920264f809b69ccb61be013538c2162154e6ee7fa3d27e748eec89b51315b5b')
sha256sums_aarch64=('afd793de48821166e96b89ed816a8a79a77a8f558d407d11a5ab96e59a59e94a')
sha256sums_x86_64=('fbd2fa56dc3249b94d2786b8df6bedaa6422f1dcd77a8faf9fdedab3201e685a')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${pkgdir}/opt" --gname root --uname root
    mv "${pkgdir}/opt/${pkgname%-bin}-"* "${pkgdir}/opt/${pkgname%-bin}"
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "Maa-X" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}