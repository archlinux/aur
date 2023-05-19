# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="objtoschematic-bin"
_appname="ObjToSchematic"
pkgver=0.7.1
pkgrel=4
pkgdesc="A tool to convert 3D models into Minecraft formats such as .schematic, .litematic, .schem and .nbt"
arch=('x86_64')
url="https://objtoschematic.com/"
_githuburl="https://github.com/LucasDower/ObjToSchematic"
license=('BSD3')
conflicts=("${pkgname%-bin}-appimage" "${pkgname%-bin}")
depends=('libcups' 'mesa' 'libxcomposite' 'glibc' 'libxext' 'at-spi2-core' 'gtk3' 'libx11' 'libxrandr' 'gdk-pixbuf2' 'bash' 'cairo' 'alsa-lib' \
    'expat' 'dbus' 'libxfixes' 'libxdamage' 'nspr' 'libxcb' 'libxkbcommon' 'nodejs' 'nss' 'libdrm' 'pango' 'gcc-libs' 'libxshmfence' 'glib2')
makedepends=('gendesk')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-x64.zip")
sha256sums=('5953facd08818a8c35a4360f220ecf72d681c37f979db85f028b5c5b8eb086c8')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_appname}-${pkgver}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/res/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f --icon "${pkgname%-bin}" --categories "Game" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${_appname} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}