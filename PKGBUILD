# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=diffuse
pkgname="${_pkgname}-player-bin"
pkgver=3.4.0
pkgrel=1
pkgdesc="A music player that connects to your cloud/distributed storage."
arch=('x86_64')
url="https://diffuse.sh/"
_ghurl="https://github.com/icidasset/diffuse"
license=("LicenseRef-PPL-2.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-x64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/icidasset/diffuse/main/LICENSE"
)
sha256sums=('7c616273e8e1f78ced354d6613810dbdc115a7ccc42fae3102d5210fe8d1ee84'
            '22f6e9359127b271eba050bc6e87abc699982ace7a6b386c1c346c7f3154eda8')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|Exec=${_pkgname}|Exec=${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1716x1716/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}