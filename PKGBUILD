# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sixgrid-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="Open-Source Desktop Client for e926/e621 and websites alike"
arch=("x86_64")
url="https://github.com/SixGrid/sixgrid"
license=("Apache")
provides=("${pkgname%-bin}")
conflit=("${pkgname%-bin}")
depends=('java-runtime' 'bash' 'electron11' 'gcc-libs' 'glibc')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-58cccb3b42651ae2e53a0aaffc778b691db364c0-linux-amd64.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/SixGrid/sixgrid/main/build/icons/256x256.png"
    "${pkgname%-bin}.sh")
sha256sums=('d2e66e50f7003566568e33f8573f8475752cd0ecc2af0f9f1c5dc3ed4f0e9e06'
            'b46d32712bb69e434de0bfd6187e588e1cd45a0b79054dbd7c042cddec6051eb'
            'f25f6f622d83e32708a311cc88a912bdc2ba2e30258e998fcd2816e49ded55f4')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Network;Utility" --name "SixGrid" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}