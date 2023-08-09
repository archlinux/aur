# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chrome-remote-desktop-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple Desktop application for Chrome Remote Desktop, built using Electron.js"
arch=('x86_64')
url="https://github.com/mikepruett3/chrome-remote-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/mikepruett3/chrome-remote-desktop/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('2744f2b036307257d59bc4c7f40342c4c3af7b87d3306af22ada22380397ab30'
            '82f04c17c97a90cb676f7eec2bdeca09cfff8a6779b310226d8e750a70abad79'
            'f798d523bc883817bfb0edf417a7bfe3e5dfeab7f14586c6cbef9aadeca9bf19')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}