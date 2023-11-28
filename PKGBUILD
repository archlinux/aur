# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=venom86-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="An x86 emulator/VM by Qrodex. Or a GUI wrapper for the v86-module"
arch=("x86_64")
url="https://github.com/Qrodex/venom86"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron25'
    'perl'
    'python'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('6f12508a814e41ecbcf45c7a165ddce88c8ee402dcefbd7af36763c489946b3a'
            'ec4194e4fb301bf5e1c4ea807f6552acb22b04fbbf73894cfb4860f115951b1f')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${pkgname%-bin}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}