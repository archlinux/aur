# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=google-calender-widget
pkgver=1.0.2
pkgrel=1
pkgdesc="An unofficial google calendar desktop widget for Windows, Mac and Linux"
arch=('x86_64')
url="https://github.com/p32929/google-calender-widget"
license=('MIT')
conflicts=("${pkgname}")
depends=('gcc-libs' 'libxcomposite' 'libx11' 'at-spi2-core' 'mesa' 'cairo' 'nspr' 'glib2' 'glibc' 'libcups' 'libxdamage' \
    'alsa-lib' 'dbus' 'libdrm' 'pango' 'expat' 'nss' 'libxrandr' 'gtk3' 'libxkbcommon' 'libxfixes' 'libxcb' 'libxext')
makedepends=('npm' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cee790e1485d32d680a1a756d183760ac606b0fcc49599a1322a570eeac0d0e8')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run dist:linux
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r  "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}