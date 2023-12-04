# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=maduchat-frontend-bin
_pkgname=MaduChat
pkgver=1.2.0
_electronversion=26
pkgrel=1
pkgdesc="A chat application which has a global chat, friend system, settings and lots of other features"
url="https://github.com/Madu-de/MaduChat"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-armv7l.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
sha256sums_aarch64=('38e9b33d63c5e99746a57c962ce24c1520ef56c549a2add6daa49530dd5e294f')
sha256sums_armv7h=('149582d54149a771f1de784cd99be69fbaa4c8e065d20371c3b1aee87ae7b5c3')
sha256sums_x86_64=('9875c3f571a154256c291533f2e64b08aca6abb56ed621a56a6b2d265cc9883a')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Network" --name "${_pkgname}" --exec "${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-linux-"*/resources/app/assets/icons/icon-512x512.png \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}