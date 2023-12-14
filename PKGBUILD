# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=story-writer-bin
_pkgname=Story-writer
pkgver=8.12.6
pkgrel=6
pkgdesc="A very excellent knowledge management software.小书匠是一款非常优秀的知识管理软件."
arch=('i686' 'x86_64')
url="http://soft.xiaoshujiang.com/"
_ghurl="https://github.com/suziwen/markdownxiaoshujiang"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glib2'
    'nspr'
    'pango'
    'libcups'
    'libxdamage'
    'libxkbcommon'
    'nss'
    'libx11'
    'libxcb'
    'mesa'
    'wayland'
    'libxext'
    'libxcomposite'
    'at-spi2-core'
    'alsa-lib'
    'libxrandr'
    'expat'
    'libdrm'
    'libxfixes'
    'cairo'
)
makedenpends=(
    'gendesk'
)
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux32.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux64.zip")
source=("${pkgname%-bin}.sh")
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.zip")
sha256sums=('98c1e314bff406c7689a1f4e109e1ecdfceb871b24a42961a9f40b4b54fd61a8')
sha256sums_i686=('b8c3bcd2decfa84c2b73e93146c66902448dd77812b6b209559f8f194827d697')
sha256sums_x86_64=('1d3b117ee364137d1c85ac299969a0484eb7761f3f2496dd654ae338acb37b24')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runappname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/opt/${pkgname%-bin}"
    find "${srcdir}/opt/${pkgname%-bin}" -type f -exec chmod -R a+r {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/credits.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}