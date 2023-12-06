# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=maduchat-frontend-bin
_pkgname=MaduChat
pkgver=1.2.1
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
sha256sums_aarch64=('2325d628fc42a78a9ecd475b116c69a0c17b4d970ebe69dad83bc03c74797ffc')
sha256sums_armv7h=('9820879bc6f104683b8a447f3b799260a7740144de219040cc4406c33b9793f5')
sha256sums_x86_64=('aa15825954e758f3e41e3cd2bc806cb7bf550c9c3f35eaff69820f6356ee163b')
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