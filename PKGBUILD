# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ricochlime-bin
_pkgname=Ricochlime
_appname="com.adilhanney.${pkgname%-bin}"
pkgver=1.10.1
pkgrel=1
pkgdesc="A game where you attack the advancing slimes with your ricocheting projectiles."
arch=(
    'aarch64'
    'x86_64'
)
url="https://ricochlime.adil.hanney.org/"
_ghurl="https://github.com/adil192/ricochlime"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'gstreamer'
    'gst-plugins-base-libs'
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('7a232e68a07c829390ea2b50cf8214db1d02ebe5fa8713722869352365aa2e92')
sha256sums_aarch64=('97ba9112e4cdcec0c6bd37afd8a558bfa3cff303bbda06c7ab199768ce01fa03')
sha256sums_x86_64=('3e65dec5237d691a91c1a4d36c6da177355b254565d67fa0dd7cf29471bd4200')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}."* -C "${srcdir}/opt/${pkgname%-bin}"
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/opt/${pkgname%-bin}/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}