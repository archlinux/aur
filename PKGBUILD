# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ficus-bin"
pkgver=0.2.1
pkgrel=1
pkgdesc="A software for editing and managing markdown documents, developed by the gg=G team."
arch=('x86_64')
url="https://ficus.world/"
_githuburl="https://github.com/Thysrael/Ficus"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=('electron13')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.asar::${_githuburl}/releases/download/v${pkgver}/app.asar"
    "https://raw.githubusercontent.com/Thysrael/Ficus/main/LICENSE"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/Thysrael/Ficus/main/build/icon.png"
    "${pkgname%-bin}.sh")
sha256sums=('fb3a407722baa7b48b81db2753ae12f47799a3a434122d47db8b320c6c4ba993'
            '062dfd6ae4c19f555ebbdba752598c98510837687393a38a3602b711890430d7'
            '3c8344b3daac5c775a3bf38518e5eee024566d7ea0a3f72c543a7c7ae13f72ef'
            '7efd1cbfdcaa7492e55c72e90cbd53fc0255c7e64f45a0c413a5688f9af895a8')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --pkgname "${pkgname%-bin}" --icon "${pkgname%-bin}" --categories "Utility" --name "Ficus" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}