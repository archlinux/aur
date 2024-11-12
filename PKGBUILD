# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=icalingua
pkgname="${_appname}++-bin"
_pkgname='Icalingua++'
pkgver=2.12.24
_electronversion=22
pkgrel=1
pkgdesc="A branch of deleted Icalingua, with limited support.(Prebuilt version.Use system-wide electron)"
arch=(
    "aarch64"
    "armv7h"
    "x86_64"
)
url="https://github.com/Icalingua-plus-plus/Icalingua-plus-plus"
license=("AGPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-electron"
)
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.x86_64.rpm")
source=("${pkgname%-bin}.sh")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('084e52a1f16d304ff06c1a5a904c110c6bf0a39c675133ae816e733f24d919a6')
sha256sums_armv7h=('870b7d086ac3c201828cfbef193138c1795bd6b3c60d861da5b70b8772588114')
sha256sums_x86_64=('429cfe305d929ceba443e2b3eedab22c013dc1d82e1fce12832464370b39eb6a')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -e "
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
        s/\"\/opt\/${_pkgname}\/${_appname}\"/${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
