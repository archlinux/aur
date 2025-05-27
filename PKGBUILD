# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tinytotp-bin
_pkgname=TinyTotp
pkgver=4.6.1
pkgrel=1
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
sha256sums=('3c4e1ce2168f8cc49ae638964bad779f57686c6588d5a385a17d9c0b53eea80e')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/usr\/share\/${_pkgname}\/${_pkgname}.jar/\/usr\/lib\/${pkgname%-bin}\/${_pkgname}.jar/g
        s/\/usr\/share\/${_pkgname}\/icon.svg/${pkgname%-bin}/g
        5i\Categories=Utility;
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm644 "${srcdir}/usr/share/${_pkgname}/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/${_pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/${_pkgname}/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
