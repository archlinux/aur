# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="gotepad-bin"
pkgver=2.3.1
pkgrel=1
pkgdesc="A simple text editor built with Wails"
arch=('x86_64')
url="https://github.com/Sammy-T/gotepad"
license=('MIT')
depends=('glibc' 'webkit2gtk' 'gdk-pixbuf2' 'gtk3' 'glib2')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux.zip"
    "LICENSE::https://raw.githubusercontent.com/Sammy-T/gotepad/master/LICENSE"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/Sammy-T/gotepad/master/build/appicon.png")
sha256sums=('b18259415783819a2491777172bdab700934183761cb36d8e0274ec720b11c25'
            'dca196dfc07025990b7613625b114fa8ae063e0fb5de6f29a81e42ffd1b5eaae'
            'de674115ab3a065b2d5f6f229777ed33369ccdeabdc6020047d72fe35441014d')
 
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/build/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}