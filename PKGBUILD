# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: qlrd <qlrddev at gmail dot com>
pkgname=krux-installer-bin
_pkgname="org.selfcustody.${pkgname%-bin}"
pkgver=0.0.20
pkgrel=2
pkgdesc="A GUI based application to flash Krux firmware on K210 based devices.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/selfcustody/krux-installer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"    
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/selfcustody/krux-installer/v${pkgver}/LICENSE"
)
sha256sums=('23b1c0ae646aa7255b19b50725f1e9576faf50162c48df5bfded4afcc836a742'
            '75486ea0af9309140ca6e2c401d7e67bea8f4892344e5707f6394dc5e83dfc44')
prepare() {
    sed -i -e "
        s/\/usr\/local\/bin\///g
        s/\/usr\/share\/icons\/hicolor\/512x512\/apps\/${pkgname%-bin}.png/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}