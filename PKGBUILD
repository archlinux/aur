# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hexhoot-bin
pkgver=1.0.3
pkgrel=3
pkgdesc="An Opensource Peer-to-peer communication platform with Zero-Knowledge-Proof based authentication."
arch=(x86_64)
url="http://blog.hexhoot.com/"
_githuburl="https://github.com/zenineasa/HexHoot"
license=('AGPL3')
depends=('bash' 'electron24')
makedepends=('asar')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('32718c19454f79216858ef3406f59a777e3f1724330d716498d5b4cb262eab9d'
            '74180411d4030cd78989bb883cd7c316632c19b9aa6d15374eab264de3ddd8d1')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}