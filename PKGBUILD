# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=salvage-bin
_pkgname=Salvage
pkgver=2.3.0
pkgrel=1
pkgdesc="Copy files comfortably and automate your backups.Prebuilt version"
arch=('x86_64')
url="https://github.com/RenanSui/salvage"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('beeabcaea3e7661241344c97087aef5f8b5d0cdf8bffb623c49f8d8adf04cfa2')
package() {
    sed -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2}/apps/${pkgname%-bin}.png"
    done
}