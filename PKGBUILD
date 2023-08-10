# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aviutl-package-manager-bin
_appname="AviUtl Package Manager"
pkgver=3.6.3
pkgrel=4
pkgdesc="A software that assists in the installation of AviUtl itself and its plugins and scripts."
arch=('x86_64')
url="https://team-apm.github.io/apm/"
_githuburl="https://github.com/team-apm/apm"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23' 'gcc-libs' 'glibc' 'lib32-gcc-libs' 'lib32-glibc')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/AviUtl.Package.Manager-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/team-apm/apm/main/icon/apm256.png"
    "${pkgname%-bin}.sh")
sha256sums=('6436430f394ec6a326fb1328c4856dbfc05c5031dd0b2dacbd566d4c93838ff8'
            '7b59d53b7a0d52c6885f52fe28fba7a3353ca8362f82ec0084f9652dff2d9b5e'
            'd31fbdc9a6340fed7c04e0ac13d7532c70785c3d17093fc72fc3cbd05afcb41a')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/${_appname}-linux-x64/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}