# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=url-collector-bin
_pkgname=urlcollector
pkgver=2.1
pkgrel=5
pkgdesc="Desktop application for collect web-links.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/TechnoMag82/UrlCollector"
license=('GPL-1.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v.${pkgver}/${pkgname%-bin}_${pkgver}-2_amd64.deb"
)
sha256sums=('5cdb7886c937558fd6c083c0b17cf9453b80b4d3e4e9f9523080092414464ce5')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=urlcol/Exec=${pkgname%-bin}/g
        s/${_pkgname}.png/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/urlcol" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}