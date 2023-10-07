# Maintainer: Anton Reshetov
pkgname=masscode-bin
_pkgname=massCode
pkgver=3.9.0
pkgrel=1
pkgdesc="A free and open source code snippets manager for developers"
arch=('x86_64')
url="https://masscode.io/"
_githuburl="https://github.com/massCodeIO/massCode"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron16')
makedepends=('gendesk' 'squashfs-tools')
source=("${pkgname%-bin}-${pkgver}.snap::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.snap"
    "${pkgname%-bin}.sh"
)
sha256sums=('db5b64d8edc9ed48b31268a1b619c5f89f493cd61fa35803839658eb76203119'
            'd87bbdc2b2585aa2a572ed38898c94ae127e7ff6beab0aee26cd0624eea55bd6')
build() {
    unsquashfs "${srcdir}/${pkgname%-bin}-${pkgver}.snap"
    gendesk -q -f -n --categories "Development;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}