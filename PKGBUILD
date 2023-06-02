# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="affine-bin"
_appname=AFFiNE
pkgver=0.6.0
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use."
arch=('x86_64')
url="https://affine.pro/"
_githuburl="https://github.com/toeverything/AFFiNE"
license=('MPL2')
options=(!strip)
providers=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('mesa' 'gcc-libs' 'libxcb' 'libdrm' 'alsa-lib' 'libxfixes' 'libxcomposite' 'libxext' 'libxrandr' 'libcups' 'nss' 'dbus' \
    'at-spi2-core' 'sh' 'gtk3' 'glib2' 'nspr' 'libxkbcommon' 'expat' 'glibc' 'libx11' 'cairo' 'pango' 'libxdamage' 'nodejs')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-stable-linux-x64.zip")
sha256sums=('67a18e0b2c8c8fb7122afa15c4dce8fed37bdcf2952f7af0c8a6f5180c1cde89')
package() {
    install -Dm755 -d "${pkgdir}/opt/${_appname}"
    cp -r "${srcdir}/${_appname}-linux-x64/"* "${pkgdir}/opt/${_appname}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${_appname}/resources/app/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${_appname}/${_appname} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}