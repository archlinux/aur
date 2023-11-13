# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=borg-explorer-bin
_appname="Borg Explorer"
pkgver=0.0.8
pkgrel=5
pkgdesc="An electron-based UI for exploring Borg Backup repositories"
arch=("x86_64")
url="https://github.com/Netruk44/borg-repository-explorer"
license=('MIT')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron22'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_appname// /.}-linux-x64-${pkgver}.zip"
    "LICENSE.md::https://raw.githubusercontent.com/Netruk44/borg-repository-explorer/v${pkgver}/license.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('af6cc3b6689ffafe8a3a8abebabe5d04d351a23aa9fb3bb6567f2f12b65f1353'
            '71d8ae0fab83a418158860542b02d9df28ef74b599b75e57ac2057bdf478aaaa'
            '2497614ffa83c0f2ff68aa43332e2f07f7150a43a2562fcc0ff0e0d3f048b7c9')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_appname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}