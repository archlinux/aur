# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chengla-linux-unofficial-bin
pkgver=1.0.3
pkgrel=2
pkgdesc="橙啦平台的非官方 Linux 客户端"
arch=("x86_64")
url="https://github.com/pokon548/chengla-for-linux"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-amd64-${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('3ee3fcc9400f6b0aa4bf4231f44a9ceffa181e778a9276aa8a8c0b703c4b218a'
            'f539debf8d667d8fda36912f21be9d9cd10c9bf7ea6e6627e2d419aa71cb6215')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app.asar.unpacked/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.top"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "chengla-linux橙啦" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}