# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lumen-bin
_appname=Project.L.U.M.E.N.
pkgver=1.2.2
pkgrel=2
pkgdesc="A simple and modulable personal assistant built on Electron."
arch=('x86_64')
url="https://github.com/L-U-M-E-N/lumen-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('expat' 'alsa-lib' 'cairo' 'libxcb' 'libxdamage' 'libxkbcommon' 'nss' 'libdrm' 'gcc-libs' 'dbus' 'glibc' 'pango' \
    'at-spi2-core' 'libxfixes' 'libcups' 'gtk3' 'mesa' 'libxext' 'libxrandr' 'glib2' 'libx11' 'nspr' 'libxcomposite')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_appname}-linux-x64.zip")
sha256sums=('37e1d2848757207cf3bb29fe43fe63e1791e31211eb9f5f1a209828653818843')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}/resources/app/data/${pkgname%-bin}_desktop" "${pkgdir}/opt/${pkgname%-bin}/resources/app/tmp"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${pkgdir}/opt/${pkgname%-bin}" --gname root --uname root
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/img/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    mv "${pkgdir}/opt/${pkgname%-bin}/${_appname}" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}" 
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "L.U.M.E.N" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}