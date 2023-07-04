# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="seven-desktop-bin"
pkgver=1.3.0
pkgrel=1
pkgdesc="The official cross-platform desktop application for the seven.io SMS Gateway."
arch=('x86_64')
url="https://www.seven.io/en/docs/apps/desktop/"
_githuburl="https://github.com/seven-io/desktop"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libcups' 'dbus' 'libdrm' 'nspr' 'pango' 'libxcb' 'glib2' 'alsa-lib' 'glibc' 'gcc-libs' 'gtk3' 'nss' 'libxfixes' \
    'at-spi2-core' 'libxrandr' 'expat' 'libxext' 'libx11' 'libxkbcommon' 'cairo' 'libxcomposite' 'mesa' 'libxdamage')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('a7a9efc3ab8ff386a5c9827dbc825daf482e18f2e8528bd936925e5d6c2aa8a6')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|Exec=${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}