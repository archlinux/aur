# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=barklarm-bin
pkgver=1.11.4
pkgrel=1
pkgdesc="Displays the status of projects as an item in the tray menu bar"
arch=('x86_64')
url="https://www.barklarm.com"
_ghurl="https://github.com/Barklarm/barklarm-app"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron25'
)
makedepends=(
    'asar'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('045397c3696f9b583003fcafa3c7c41e3a49e3ec04f6590811d2ab5798ddf02c'
            'f89ab834a71afa036d8080823eabdc4484e5ef2304298624ca233b5c0b2eafac')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    asar p "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/app.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}