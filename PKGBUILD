# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=positron-bin
pkgver=0.0.3
pkgrel=3
pkgdesc="Desktop application that allows you to manage your movie and show watchlist. It is built using Electron and React."
arch=('x86_64')
url="https://github.com/arjunindia/positron"
license=("custom")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_1.0.0_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('55ae50a9e37c51c459186886fe2651e0aa17ddbd52cea69651f7c618ff71fe46'
            '3a4fb84462895cd73d4ef29ab0499351b33016928c1bae47e45673f4941ba602')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}