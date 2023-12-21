# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ficus-bin
pkgver=0.2.1
_electronversion=13
pkgrel=5
pkgdesc="A software for editing and managing markdown documents, developed by the gg=G team."
arch=('x86_64')
url="https://ficus.world/"
_ghurl="https://github.com/Thysrael/Ficus"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-desktop")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.asar::${_ghurl}/releases/download/v${pkgver}/app.asar"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Thysrael/Ficus/v${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Thysrael/Ficus/v${pkgver}/build/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('fb3a407722baa7b48b81db2753ae12f47799a3a434122d47db8b320c6c4ba993'
            '062dfd6ae4c19f555ebbdba752598c98510837687393a38a3602b711890430d7'
            '3c8344b3daac5c775a3bf38518e5eee024566d7ea0a3f72c543a7c7ae13f72ef'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "Ficus" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.asar" "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}