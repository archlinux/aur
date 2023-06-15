# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=borg-explorer-bin
_appname="Borg Explorer"
pkgver=0.0.8
pkgrel=1
pkgdesc="An electron-based UI for exploring Borg Backup repositories"
arch=(x86_64)
url="https://github.com/Netruk44/borg-repository-explorer"
license=('MIT')
depends=('libxfixes' 'libcups' 'gtk3' 'pango' 'glibc' 'alsa-lib' 'at-spi2-core' 'gcc-libs' 'expat' 'libdrm' 'nspr' 'libxcb' \
    'libxdamage' 'libxext' 'libxcomposite' 'libx11' 'mesa' 'dbus' 'cairo' 'libxkbcommon' 'glib2' 'libxrandr' 'nss')
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/Borg.Explorer-linux-x64-${pkgver}.zip")
sha256sums=('af6cc3b6689ffafe8a3a8abebabe5d04d351a23aa9fb3bb6567f2f12b65f1353')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_appname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec '"/opt/borg-explorer/Borg Explorer" %U'
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
