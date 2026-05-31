# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=calendar-bin
_pkgname=Calendar
_appname="io.github.KangLin.${_pkgname}"
pkgver=1.0.23
pkgrel=1
pkgdesc="Task, calendar, Vision protection.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/KangLin/Calendar"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'qt6-scxml'
    'openssl'
    'qt6-base'
    'qt6-multimedia'
    'qt6-svg'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/rabbit${pkgname%-bin}_${pkgver}_ubuntu26.04_aarch64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/rabbit${pkgname%-bin}_${pkgver}_ubuntu26.04_x86_64.deb")
sha256sums=('7bf300a49fb28500eeb082a713bde6a0ec98328630c0c53df5610512c2449cbc')
sha256sums_aarch64=('d24032f90566c1ad6514ce16d81af5dc95b63236e8f10fd936160b8c26a98b5b')
sha256sums_x86_64=('4f8ded88216dec38805bed284da9479192adc3e46a0fdd7d973d23cd74bf2691')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}App-v${pkgver}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=${_pkgname}App/${pkgname%-bin}/g
        s/Path=\/opt\/${_pkgname}/Path=\/usr\/lib\/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
