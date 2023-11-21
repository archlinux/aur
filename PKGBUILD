# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qrocrown-bin
_pkgname=QroCrown
pkgver=1.2.8
pkgrel=2
pkgdesc="An enhanced launcher for keeping your games. By QRodEX for QRodEXers."
arch=('x86_64')
url="https://github.com/Qrodex/QroCrown"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'electron20'
    'wine'
    'winetricks'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('2b4f720e42c8c6ad25f7c5b429ac04d105dc9124bedf4ba221e7783db7e19225'
            'f43107ecbc79d9b089d002b87fae1fa59a56f5831276ea5b81bcf91b12526a50')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}