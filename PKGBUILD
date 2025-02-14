# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tinytotp-bin
_pkgname=TinyTotp
pkgver=4.2.0
pkgrel=2
pkgdesc="A Totp Client.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/kryptonbutterfly/TinyTotp"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'xdg-utils'
    'java-runtime>=18'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.deb"
)
sha256sums=('8eddeab00392bb8d613be65adedd6fd093524a3955168b35ff2d95bbb2f6bce0')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\/usr\/share\/${_pkgname}\/${_pkgname}.jar/\/usr\/lib\/${pkgname%-bin}\/${_pkgname}.jar/g
        s/\/usr\/share\/${_pkgname}\/icon.svg/${pkgname%-bin}/g
        5i\Categories=Utility;
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm644 "${srcdir}/usr/share/${_pkgname}/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/${_pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/${_pkgname}/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}