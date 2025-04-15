# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=timecop-bin
_appname=ca.hamaluik.Timecop
pkgver=1.8.0
pkgrel=9
pkgdesc='A time tracking app that respects your privacy and the gets the job done without being fancy.(Prebuilt version)'
arch=(
    'aarch64'
    'x86_64'
)
url="https://timecop.app/"
_ghurl="https://github.com/hamaluik/timecop"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-aarch64.tar.xz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x86_64.tar.xz")
sha256sums=('e79ca1f4384d68e22a64a55c6e8ded45bfce0b6dfb06365a925aa6f8b6c41003')
sha256sums_aarch64=('cf376f25cde81d5299c4f543eee15380450470512630ae28697557ddea77bd47')
sha256sums_x86_64=('c2a00bdcb9a32eeaa566d0f1de4d1253460761abe358767209b441748818233c')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/${pkgname%-bin}-linux-${CARCH}/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-bin}-linux-${CARCH}/bin/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}/${_appname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
}