# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="positron-bin"
pkgver=0.0.3
pkgrel=2
pkgdesc="Desktop application that allows you to manage your movie and show watchlist. It is built using Electron and React."
arch=('x86_64')
url="https://github.com/arjunindia/positron"
license=("custom")
depends=('bash' 'electron22')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_1.0.0_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('55ae50a9e37c51c459186886fe2651e0aa17ddbd52cea69651f7c618ff71fe46'
            'b1d5400298f2763d88436d6979fd0bbb7b8885f82c9e54679616f4c32ed6abd5')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}