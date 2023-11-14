# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hexhoot-bin
pkgver=1.0.3
pkgrel=5
pkgdesc="An Opensource Peer-to-peer communication platform with Zero-Knowledge-Proof based authentication."
arch=(x86_64)
url="http://blog.hexhoot.com/"
_ghurl="https://github.com/zenineasa/HexHoot"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron24'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('32718c19454f79216858ef3406f59a777e3f1724330d716498d5b4cb262eab9d'
            '47680e0e2fe75cf5faa9c963d515f229d91f48a94463c717044301ea80e52dcc')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}