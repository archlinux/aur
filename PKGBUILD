# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=objtoschematic-bin
_pkgname=ObjToSchematic
pkgver=0.7.1
pkgrel=7
pkgdesc="A tool to convert 3D models into Minecraft formats such as .schematic, .litematic, .schem and .nbt"
arch=('x86_64')
url="https://objtoschematic.com/"
_githuburl="https://github.com/LucasDower/ObjToSchematic"
license=('BSD')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libcups' 'mesa' 'libxcomposite' 'glibc' 'libxext' 'at-spi2-core' 'gtk3' 'libx11' 'libxrandr' 'gdk-pixbuf2' 'bash' 'cairo' 'alsa-lib' \
    'expat' 'dbus' 'libxfixes' 'libxdamage' 'nspr' 'libxcb' 'libxkbcommon' 'nss' 'libdrm' 'pango' 'gcc-libs' 'libxshmfence' 'glib2')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip")
sha256sums=('5953facd08818a8c35a4360f220ecf72d681c37f979db85f028b5c5b8eb086c8')
prepare() {
    gendesk -q -f -n --categories "Game" --name "${_pkgname}" --exec "${_pkgname} --no-sandbox %U"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${_pkgname}-${pkgver}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-linux-x64/resources/app/res/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}