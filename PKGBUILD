# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=story-writer-bin
_pkgname="Story-writer"
pkgver=8.12.6
pkgrel=4
pkgdesc="A very excellent knowledge management software.小书匠是一款非常优秀的知识管理软件."
arch=('i686' 'x86_64')
url="http://soft.xiaoshujiang.com/"
_githuburl="https://github.com/suziwen/markdownxiaoshujiang"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glib2' 'nspr' 'pango' 'libcups' 'libxdamage' 'libxkbcommon' 'nss' 'libx11' 'libxcb' 'mesa' 'wayland' 'libxext' \
    'dbus' 'libxcomposite' 'gcc-libs' 'at-spi2-core' 'alsa-lib' 'libxrandr' 'expat' 'libdrm' 'glibc' 'libxfixes' 'cairo')
makedenpends=('gendesk')
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-linux32.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-linux64.zip")
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.zip")
sha256sums_i686=('b8c3bcd2decfa84c2b73e93146c66902448dd77812b6b209559f8f194827d697')
sha256sums_x86_64=('1d3b117ee364137d1c85ac299969a0484eb7761f3f2496dd654ae338acb37b24')
prepare() {
    mkdir -p "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/${pkgname%-bin}"
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
    find "${srcdir}/${pkgname%-bin}" -type f -exec chmod -R a+r {} \;
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/credits.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}