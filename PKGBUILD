# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chengla-linux-unofficial-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="橙啦平台的非官方 Linux 客户端"
arch=("x86_64")
url="https://github.com/pokon548/chengla-for-linux"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'asar')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-amd64-${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('7f5b4604796958149d6fa013c332ee559f59f3aab6313ba593aa2aa1a2c0c9ac'
            '6f9e3ee899b5f03bc89f68de1727a2cad1a0c3c876aeb94ae182489590a72390')
prepare() {
    asar extract "${srcdir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/resources/app.asar.unpacked/resources/icon.png" -t "${srcdir}/app.asar.unpacked/resources"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar" 
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app.asar.unpacked/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "chengla-linux橙啦" --exec "${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}