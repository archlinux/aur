# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=japreader-bin
pkgver=1.9.3
pkgrel=1
pkgdesc="An Electron app that helps you read Japanese text."
arch=('x86_64')
url="https://github.com/marisukukise/japReader"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('f2e12d33c495bcfa79af141986357d77849752c66d4ae80ad377c15d64ae68b5'
            '55bb7fc42560f3c87a0cb008c6e7932dd7010544f6f177790893073b56eecb61')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/app.asar"
    sed "s|${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}