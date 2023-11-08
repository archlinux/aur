# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=seven-desktop-bin
pkgver=1.3.0
pkgrel=4
pkgdesc="The official cross-platform desktop application for the seven.io SMS Gateway."
arch=('x86_64')
url="https://www.seven.io/en/docs/apps/desktop/"
_ghurl="https://github.com/seven-io/desktop"
license=('MIT')
prpvides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron25'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('a7a9efc3ab8ff386a5c9827dbc825daf482e18f2e8528bd936925e5d6c2aa8a6'
            '39a1cb20edc355b2c8b9217a1c9ac3387f53f2d48eca35242692e2b97b4421f6')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}