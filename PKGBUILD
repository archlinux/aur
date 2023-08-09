# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=timecop-bin
_appname=ca.hamaluik.Timecop
pkgver=1.8.0
pkgrel=2
pkgdesc='A time tracking app that respects your privacy and the gets the job done without being fancy.'
arch=('aarch64' 'x86_64')
url="https://timecop.app/"
_githuburl="https://github.com/hamaluik/timecop"
license=('Apache')
depends=('harfbuzz' 'glib2' 'gdk-pixbuf2' 'cairo' 'pango' 'hicolor-icon-theme' 'libepoxy' 'at-spi2-core' 'gtk3' 'glibc' 'gcc-libs')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-aarch64.tar.xz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x86_64.tar.xz")
sha256sums_aarch64=('cf376f25cde81d5299c4f543eee15380450470512630ae28697557ddea77bd47')
sha256sums_x86_64=('c2a00bdcb9a32eeaa566d0f1de4d1253460761abe358767209b441748818233c')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-${CARCH}/bin/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    sed "s|Exec=${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/${pkgname%-bin}-linux-${CARCH}/${_appname}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}/${_appname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
}