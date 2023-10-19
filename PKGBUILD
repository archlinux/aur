# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=paradise-pi-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="A facility control panel for sACN & OSC, in Electron."
arch=("x86_64")
url="https://paradise-pi.github.io/ParadisePi/"
_githuburl="https://github.com/Paradise-Pi/ParadisePi"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('c8e3630084b1ec329c63b3468d4feefd7c9ff9e55c05cf12079a6128f4d453df'
            '6c5bd9dc55fce23d0fb150abfcdc05ad25c915d367266a12a77dae6bc272e4c5')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}