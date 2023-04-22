# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="affine-bin"
_appname=AFFiNE
pkgver=0.5.4.beta.0
_pkgver=beta.0
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use."
arch=('x86_64')
url="https://affine.pro/"
_githuburl="https://github.com/toeverything/AFFiNE"
license=('custom:MPL2')
options=(!strip)
providers=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('mesa' 'gcc-libs' 'libxcb' 'libdrm' 'alsa-lib' 'libxfixes' 'libxcomposite' 'libxext' 'libxrandr' 'libcups' 'nss' 'dbus' \
    'at-spi2-core' 'sh' 'gtk3' 'glib2' 'nspr' 'libxkbcommon' 'expat' 'glibc' 'libx11' 'cairo' 'pango' 'libxdamage' 'nodejs')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver%.beta.0}-${_pkgver}/${pkgname%-bin}-beta-linux-x64.zip"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('417e5729a4b1ff08a7852cb9482b81107e30911f8f0ed515dd1aeb747c54b140'
            '81b2d1b5306fb6a9a9624cf94d455af1717272f564cbc91000f0a4783144c5f6')
package() {
    install -Dm755 -d "${pkgdir}/opt/${_appname}"
    cp -r "${srcdir}/${_appname}-beta-linux-x64/"* "${pkgdir}/opt/${_appname}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${_appname}/resources/app/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${_appname}/${_appname}-beta --no-sanbox %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}