# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=maduchat-frontend-bin
_pkgname=MaduChat
pkgver=1.1.1
pkgrel=1
pkgdesc="A chat application which has a global chat, friend system, settings and lots of other features"
url="https://github.com/Madu-de/MaduChat"
arch=('aarch64' 'armv7h' 'x86_64')
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
makedepends=('asar' 'gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-armv7l.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('9261e9c68a6171ca9ebaf6346a2a204b2d354b9185ec6a041559d982197ed6d7')
sha256sums_aarch64=('e22d03986ec56af91bac0c7f4a06bbd1b9d4534ad8ca3bfa557a087c8fd176a1')
sha256sums_armv7h=('9be7f671aea0af47b0a860f5d058e82537e7c79bea58c58244f189c0647e5421')
sha256sums_x86_64=('df2e71886ce0303baba6f6ddec3dfea99671db32aef6a90a40438b9788e48156')
build() {
    gendesk -q -f -n --categories "Network" --name "${_pkgname}" --exec "${pkgname}"
    asar p "${srcdir}/${pkgname%-bin}-${pkgver}-linux-"*/resources/app "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-linux-"*/resources/app/assets/icons/icon-512x512.png \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}