# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=url-collector-bin
_pkgname=urlcollector
pkgver=2.0
pkgrel=1
pkgdesc="Desktop application for collect web-links"
arch=('x86_64')
url="https://github.com/TechnoMag82/UrlCollector"
license=('GPL')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('qt5-base' 'gcc-libs' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb")
sha256sums=('add5377940bb6714c367bd71cca541952217ae540fd7d787e96f8f5c59d992f6')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|Exec=urlcol|Exec=${pkgname%-bin}|g;s|${_pkgname}.png|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/urlcol" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}