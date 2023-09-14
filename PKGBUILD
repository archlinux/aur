# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kui-bin
_pkgname=Kui
pkgver=13.1.4
pkgrel=3
pkgdesc="A hybrid command-line/UI development experience for cloud-native development"
arch=('aarch64' 'x86_64')
url="https://github.com/kubernetes-sigs/kui"
license=('Apache')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('libdrm' 'glibc' 'alsa-lib' 'libx11' 'pango' 'libxcomposite' 'dbus' 'mesa' 'hicolor-icon-theme' 'libxdamage' 'libxfixes' 'nspr' \
    'at-spi2-core' 'libcups' 'libxkbcommon' 'bash' 'gcc-libs' 'gtk3' 'nss' 'libxext' 'libxrandr' 'libxcb' 'expat' 'glib2' 'cairo')
makedepends=('gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.zip")
sha256sums_aarch64=('2138d7b605fb9cc0a28a7bceaa071b7b70a6a8f009110e34eeb6ec4aa0772c85')
sha256sums_x86_64=('ebdf87c7746e82d3464f5dbeae98629a9aaff94da69d817fbd9307f44ebf9a36')
prepare() {
    gendesk -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname%-bin} --no-sandbox %U"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${_pkgname}-linux-"*/* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-"*/resources/app/node_modules/"@${pkgname%-bin}-shell/build/icons/svg/${pkgname%-bin}.svg" \
        -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}