# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=my-hardware-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="A cross-platform desktop app built with Electron using Angular v16 with Signals and provides nice UI/UX Charts for monitoring CPU, Memory, and Disk usage."
arch=('x86_64')
url="https://github.com/Y-Moshe/my-hardware"
license=('custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron25')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('a5cd8a0df8b8989cd94c023aba7b5d39644a52a517f41c713f20a2b34420fcbd'
            'bc517a1dae535b9117cda845d1dc1572fc549e636d7d9dfbd2b0738856f2f3f9')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}