# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aviutl-package-manager-bin
pkgver=3.6.3
pkgrel=2
pkgdesc="A software that assists in the installation of AviUtl itself and its plugins and scripts."
arch=('x86_64')
url="https://team-apm.github.io/apm/"
_githuburl="https://github.com/team-apm/apm"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=('electron' 'gcc-libs' 'glibc' 'lib32-gcc-libs' 'lib32-glibc')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/AviUtl.Package.Manager-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/team-apm/apm/main/icon/apm256.png"
    "${pkgname%-bin}.sh")
sha256sums=('6436430f394ec6a326fb1328c4856dbfc05c5031dd0b2dacbd566d4c93838ff8'
            '7b59d53b7a0d52c6885f52fe28fba7a3353ca8362f82ec0084f9652dff2d9b5e'
            '3a65d5f8b281b23b88fd8335c11d38c9fee5b0dd13156039a6a13fe1eb7c6f62')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/AviUtl Package Manager-linux-x64/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/AviUtl Package Manager-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "AviUtl Package Manager" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}