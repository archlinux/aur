# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ricochlime-bin
_pkgname=Ricochlime
_appname="com.adilhanney.${pkgname%-bin}"
pkgver=1.1.2
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
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz")
depends=(
    'cairo'
    'harfbuzz'
    'fontconfig'
    'gtk3'
    'libepoxy'
    'pango'
    'at-spi2-core'
    'gdk-pixbuf2'
    'gstreamer'
    'gst-plugins-base-libs'
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('963a52a57f25294de30507333df4de486b67fb66a32aae9681401d03ee207859')
sha256sums_aarch64=('847c8fda7d185fd72c5968808a1436e4c3c2aa3d9f75c076818497fec76fdb7a')
sha256sums_x86_64=('69f09b2eb23bcdc93ec23f944948e8005c87f82e557bf7a39606f4390b93ffd9')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz" -C "${srcdir}/${pkgname%-bin}"
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/${pkgname%-bin}/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}/"{data,lib} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}