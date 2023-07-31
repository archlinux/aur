# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="lumen-bin"
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple and modulable personal assistant built on Electron."
arch=('x86_64')
url="https://github.com/L-U-M-E-N/lumen-desktop"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=('expat' 'alsa-lib' 'cairo' 'libxcb' 'libxdamage' 'libxkbcommon' 'nss' 'libdrm' 'gcc-libs' 'dbus' 'glibc' 'pango' \
    'at-spi2-core' 'libxfixes' 'libcups' 'gtk3' 'mesa' 'libxext' 'libxrandr' 'glib2' 'libx11' 'nspr' 'libxcomposite')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/Project.L.U.M.E.N.-linux-x64.zip")
sha256sums=('b3ce101e11512ea30033308f251106e2bbdeef3fc69eb291814c5ed64e470a38')
   
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}/resources/app/data/${pkgname%-bin}_desktop" "${pkgdir}/opt/${pkgname%-bin}/resources/app/tmp"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${pkgdir}/opt/${pkgname%-bin}" --gname root --uname root
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/img/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    mv "${pkgdir}/opt/${pkgname%-bin}/Project L.U.M.E.N." "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}" 
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "L.U.M.E.N" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}