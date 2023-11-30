# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ricochlime-bin
_pkgname=Ricochlime
_appname="com.adilhanney.${pkgname%-bin}"
pkgver=1.0.5
pkgrel=1
pkgdesc="A game where you attack the advancing slimes with your ricocheting projectiles."
arch=(
    'aarch64'
    'x86_64'
)
url="https://ricochlime.adil.hanney.org/"
_ghurl="https://github.com/adil192/ricochlime"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'cairo'
    'harfbuzz'
    'fontconfig'
    'gtk3'
    'libepoxy'
    'pango'
    'at-spi2-core'
    'gdk-pixbuf2'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('1896b729f5f827b08d3e9274b75e4b64252fc14ed752e8a0cc1822fd279ce6c5')
sha256sums_x86_64=('0002edc908225ce6d10df26472a28134d43f70edd022089f7511e76a8eb1932a')
build() {
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/"{data,lib} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}