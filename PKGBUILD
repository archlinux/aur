# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mic-mutebar-bin
pkgver=1.4.1
pkgrel=2
pkgdesc="Tiny GUI app that show microphone status"
arch=('x86_64')
url="https://github.com/azu/mic-mutebar"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/azu/mic-mutebar/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('53e36e4a720c402da1e6eb7aaef7e24f55aae79783ce24046f576418c101a2c2'
            '7d6cda6b7bbd66549dca436fbb5b95e87d019066b97dec00cd7cac5d21115d69'
            '1f4d2ddeba7b0c90f49bbd50fa1f63b049415c50374d0b9d21ce02e96ed1f238')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {    
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}//LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}