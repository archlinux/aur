# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor ZorinArch <zorinarch@protonmail.com>
pkgname=penpot-desktop-bin
_pkgname='Penpot Desktop'
pkgver=0.8.0
_electronversion=33
pkgrel=1
pkgdesc="An unofficial desktop application for the open-source design tool, Penpot.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/author-more/penpot-desktop"
license=('AGPL-3.0-only')
conflicts=("${pkgname%-bin}")
prodives=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.x86_64.rpm")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('0c6ca00d8266efa834771248fcc32630ce746ce79ea82f9601e0696effb6c9d0')
sha256sums_x86_64=('7d099832109bf6de0fa9f08e248c9348f54f335a4f54717892550cf15fae5e53')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}