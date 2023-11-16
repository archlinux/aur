# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mic-mutebar-bin
pkgver=1.4.1
pkgrel=4
pkgdesc="Tiny GUI app that show microphone status"
arch=('x86_64')
url="https://github.com/azu/mic-mutebar"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron25'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/azu/mic-mutebar/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('53e36e4a720c402da1e6eb7aaef7e24f55aae79783ce24046f576418c101a2c2'
            '7d6cda6b7bbd66549dca436fbb5b95e87d019066b97dec00cd7cac5d21115d69'
            '0f1e94a55e6bde1f76dfa588641fb7b6e137ea0b8e0136b96aa9c6e8028c75d9')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {    
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}//LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}