# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=elemntary-bin
pkgver=0.5.6
pkgrel=6
pkgdesc='A GUI application that allows your to control Wahoo Elemnt bicycle computers from a desktop PC providing some insights and hidden features.'
arch=('x86_64')
url="https://github.com/vti/elemntary"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'at-spi2-core'
    'java-runtime'
    'libxcomposite'
    'libxcb'
    'libxext'
    'pango'
    'dbus'
    'mesa'
    'expat'
    'cairo'
    'libx11'
    'libcups'
    'gtk3'
    'libdrm'
    'nspr'
    'libxrandr'
    'libxkbcommon'
    'libxfixes'
    'nss'
    'alsa-lib'
    'libxdamage'
)
makedepends=(
    'gendesk'
)
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.zip")
sha256sums=('b04a4f7f2801db40f4b02794c416890ca573254124b4c4a0b8c86b028fd607ae')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin} --no-sandbox %U"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/src/ui/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}