# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chrolog-bin"
pkgver=1.3.5
pkgrel=1
pkgdesc="A automated time tracking tool"
arch=("x86_64")
url="https://github.com/Lukylix/Chrolog"
license=('custom')
depends=('zlib' 'glibc' 'python' 'perl' 'at-spi2-core' 'mesa' 'alsa-lib' 'dbus' 'gcc-libs' 'libxkbcommon' 'gtk3' 'libx11' 'libinput' 'nss' \
    'systemd-libs' 'glib2' 'libxcb' 'pango' 'libxext' 'bash' 'cairo' 'libxrandr' 'libdrm' 'libxcomposite' 'hicolor-icon-theme' 'libcups' \
    'libxfixes' 'nspr' 'libxdamage' 'expat')
#options=(!strip)
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
replaces=("${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip")
sha256sums=('9a9c4320b99528db090889042508e5436f483597b586617bfeb8b1e315fe83c9')
     
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/resources/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "Chrolog" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}