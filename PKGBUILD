# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kui-bin
_appname=Kui
pkgver=13.1.4
pkgrel=2
pkgdesc="A hybrid command-line/UI development experience for cloud-native development"
arch=('aarch64' 'x86_64')
url="https://github.com/kubernetes-sigs/kui"
license=('Apache')
depends=('libdrm' 'glibc' 'alsa-lib' 'libx11' 'pango' 'libxcomposite' 'dbus' 'mesa' 'hicolor-icon-theme' 'libxdamage' 'libxfixes' 'nspr' \
    'at-spi2-core' 'libcups' 'libxkbcommon' 'bash' 'gcc-libs' 'gtk3' 'nss' 'libxext' 'libxrandr' 'libxcb' 'expat' 'glib2' 'cairo')
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_appname}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_appname}-linux-x64.zip")
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.zip")
sha256sums_aarch64=('2138d7b605fb9cc0a28a7bceaa071b7b70a6a8f009110e34eeb6ec4aa0772c85')
sha256sums_x86_64=('ebdf87c7746e82d3464f5dbeae98629a9aaff94da69d817fbd9307f44ebf9a36')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${pkgdir}/opt" --gname root --uname root
    mv "${pkgdir}/opt/${_appname}-linux-x64" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/node_modules/@${pkgname%-bin}-shell/build/icons/svg/${pkgname%-bin}.svg" \
        -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Development" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${_appname} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}