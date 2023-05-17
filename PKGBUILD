# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="commas-bin"
pkgver=0.25.1
pkgrel=1
pkgdesc="A hackable, pluggable terminal, and also a command runner."
arch=("x86_64")
url="https://github.com/CyanSalt/commas"
license=('ISC')
depends=('libdrm' 'expat' 'alsa-lib' 'glibc' 'cairo' 'nss' 'libxext' 'pango' 'gtk3' 'libxkbcommon' 'glib2' 'libcups' 'gcc-libs' \
    'libxfixes' 'java-runtime' 'at-spi2-core' 'libxcomposite' 'libxrandr' 'nspr' 'libxdamage' 'dbus' 'sh' 'libxcb' 'mesa' 'libx11')
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/Commas-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/CyanSalt/commas/master/resources/images/icon.png")
sha256sums=('ccf0080f24b460f26526702abe58b0b66ffdea7a67d0e0464d1a8d7e353b01e9'
            '65b65c25d8d68549dc271f7c755426ba8884f6ae9fb3a8061eec65c241345f48')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/Commas-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/Commas-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "Commas" --exec "/opt/${pkgname%-bin}/Commas --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}