# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sharefi-electron-bin
pkgver=0.4.1
pkgrel=3
pkgdesc="The sharefi app allows you to share files and folders through local network. It is fast, secure, free, easy to use and cross platform."
arch=("x86_64")
url="https://sharefi.app"
_ghurl="https://github.com/lucafornerone/sharefi-electron"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron24'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/download/v${pkgver}/linux/${pkgname%-electron-bin}-x64-v${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/lucafornerone/sharefi-electron/release/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('2ce1343513f2f904c740a6f587ae65248cb22502556c4573050e4ba461cce475'
            '3355028d7d3f5a0da30ca17099cf8f9a6c833986cbad09ce930901b3379eb0fd'
            'a6ceef840ede745fde36137f1555ed9f15c37eefa5e43cd1bb35ca421c9a7f6a')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|n %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}