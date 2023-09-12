# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gotepad-bin
pkgver=2.3.2
pkgrel=3
pkgdesc="A simple text editor built with Wails"
arch=('x86_64')
url="https://github.com/Sammy-T/gotepad"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'webkit2gtk' 'gdk-pixbuf2' 'gtk3' 'glib2')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux.zip"
    "LICENSE::https://raw.githubusercontent.com/Sammy-T/gotepad/v${pkgver}/LICENSE"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/Sammy-T/gotepad/v${pkgver}/build/appicon.png")
sha256sums=('d385b11d6abb20175de0d7df5e42f4c7fa4df92cd43c70168bc8bfdd80abe5f2'
            'dca196dfc07025990b7613625b114fa8ae063e0fb5de6f29a81e42ffd1b5eaae'
            'de674115ab3a065b2d5f6f229777ed33369ccdeabdc6020047d72fe35441014d')
prepare() {
    gendesk -f -n --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/build/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}