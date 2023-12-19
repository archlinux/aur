# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=timecop-bin
_appname=ca.hamaluik.Timecop
pkgver=1.8.0
pkgrel=5
pkgdesc='A time tracking app that respects your privacy and the gets the job done without being fancy.'
arch=(
    'aarch64'
    'x86_64'
)
url="https://timecop.app/"
_ghurl="https://github.com/hamaluik/timecop"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'harfbuzz'
    'gdk-pixbuf2'
    'cairo'
    'pango'
    'hicolor-icon-theme'
    'libepoxy'
    'at-spi2-core'
    'gtk3'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-aarch64.tar.xz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x86_64.tar.xz")
source=("${pkgname%-bin}.sh")
sha256sums=('088686f54a6f4b05e34220f46f719786b48173234e14ed0fece3597e7484e72e')
sha256sums_aarch64=('cf376f25cde81d5299c4f543eee15380450470512630ae28697557ddea77bd47')
sha256sums_x86_64=('c2a00bdcb9a32eeaa566d0f1de4d1253460761abe358767209b441748818233c')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/${pkgname%-bin}-linux-${CARCH}/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-${CARCH}/bin/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}/${_appname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
}