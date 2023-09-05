# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ricochlime-bin
_pkgname=Ricochlime
_appname="com.adilhanney.${pkgname%-bin}"
pkgver=0.5.4
pkgrel=1
pkgdesc="A game where you attack the advancing slimes with your ricocheting projectiles."
arch=('aarch64' 'x86_64')
url="https://ricochlime.adil.hanney.org/"
_githuburl="https://github.com/adil192/ricochlime"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glib2' 'gcc-libs' 'cairo' 'harfbuzz' 'fontconfig' 'gtk3' 'libepoxy' 'pango' 'glibc' 'at-spi2-core' 'gdk-pixbuf2')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('30fff0faf2dfbcebddf5b67aee36b4e7bbe35e4dfc3de5053fd1aab3233eba44')
sha256sums_x86_64=('d107f82b53f0ce7c86109f16cff4436db9200b4eff15403444110a39fc4a204e')
prepare() {
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