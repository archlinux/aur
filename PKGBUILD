# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deadbolt-bin
_pkgname=Deadbolt
pkgver=1.0.0
pkgrel=2
pkgdesc="Dead-simple file encryption for any OS"
arch=('x86_64')
url="https://github.com/alichtman/deadbolt"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}plusplus")
depends=('bash' 'electron19')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/alichtman/deadbolt/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('9e352bd7f5023fcdaa7d85f1167ba2805b2a3477af53dc547412ebff5e8f7ead'
            'b6f8e4a32cbd0221c7a41052b9e4b06e1a2216741b41d1951b9163445907cb3b'
            'c2326498127e0eae480c8f410c9600b28e7b28715724febce750224f3107625f')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {   
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}