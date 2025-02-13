# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=calendar-bin
_pkgname=Calendar
_appname="org.Rabbit.${_pkgname}"
pkgver=1.0.21
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
    'qt6-webengine'
    'qt6-multimedia'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/rabbit${pkgname%-bin}_${pkgver}_ubuntu-24.04_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/rabbit${pkgname%-bin}_${pkgver}_ubuntu-24.04_amd64.deb")
sha256sums=('7bf300a49fb28500eeb082a713bde6a0ec98328630c0c53df5610512c2449cbc')
sha256sums_aarch64=('a5c68651a5ef83eca28787ebb564a0befacbc572a5e00b8e42b81f823a7e693d')
sha256sums_x86_64=('a16f22f39493fd8fd5664f23a8eabd7e2df724e1f00c37b160fd6c608f3a2ade')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}App-v${pkgver}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\/opt\/${_pkgname}\/bin\/${_pkgname}.sh/${pkgname%-bin}/g
        s/Path=\/opt\/${_pkgname}/Path=\/usr\/lib\/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}