# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=borg-explorer-bin
_appname="Borg Explorer"
pkgver=0.0.8
pkgrel=2
pkgdesc="An electron-based UI for exploring Borg Backup repositories"
arch=(x86_64)
url="https://github.com/Netruk44/borg-repository-explorer"
license=('MIT')
depends=('electron')
makedepends=('gendesk' 'asar')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/Borg.Explorer-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('af6cc3b6689ffafe8a3a8abebabe5d04d351a23aa9fb3bb6567f2f12b65f1353'
            '82f25d176514d371bda04d443043af35e0cb68337f5dd96b45a43126e175c0f2')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/${_appname}-linux-x64/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
