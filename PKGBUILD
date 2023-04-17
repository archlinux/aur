# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stort-writer-bin
_pkgname=Story-writer
pkgver=8.12.6
pkgrel=1
pkgdesc="A very excellent knowledge management software.小书匠是一款非常优秀的知识管理软件."
arch=('x86_64')
url="http://soft.xiaoshujiang.com/"
_githuburl="https://github.com/suziwen/markdownxiaoshujiang"
license=('custom:Apache2.0')
providers=(suziwen)
confilts=("${pkgname%-bin}")
depends=('glib2' 'nspr' 'pango' 'libcups' 'libxdamage' 'libxkbcommon' 'nss' 'libx11' 'libxcb' 'mesa' 'wayland' 'libxext' \
    'dbus' 'libxcomposite' 'gcc-libs' 'at-spi2-core' 'alsa-lib' 'libxrandr' 'expat' 'libdrm' 'glibc' 'libxfixes' 'cairo')
makedenpends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-linux64.zip")
sha256sums=('1d3b117ee364137d1c85ac299969a0484eb7761f3f2496dd654ae338acb37b24')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/credits.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    gendesk -f --pkgname "${pkgname}" --pkgdesc "A very excellent knowledge management software.小书匠是一款非常优秀的知识管理软件." --icon "${pkgname}" \
        --categories "Utility" --name "${_pkgname}" --exec "/opt/${pkgname%-bin}/${_pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    find "${pkgdir}/opt" -type f -exec chmod -R a+r * {} \;
}