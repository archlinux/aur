# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: qlrd <qlrddev at gmail dot com>
_appname=krux_installer
pkgname="${_appname//_/-}-bin"
_pkgname="org.selfcustody.${pkgname%-bin}"
pkgver=0.0.21
pkgrel=1
pkgdesc="A GUI based application to flash Krux firmware on K210 based devices.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/selfcustody/krux-installer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/selfcustody/krux-installer/v${pkgver}/LICENSE"
)
sha256sums=('9986dc5d1a6a3a97fec46504f71959deed5a7a079d81c1006c5cd9cbf9834dfb'
            '75486ea0af9309140ca6e2c401d7e67bea8f4892344e5707f6394dc5e83dfc44')
prepare() {
    sed -i -e "
        s/\/usr\/local\/bin\///g
        s/\/usr\/share\/icons\/hicolor\/512x512\/apps\/${_appname}.png/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
