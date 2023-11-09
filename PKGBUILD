# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=leafview-bin
_pkgname=LeafView
pkgver=2.7.5
pkgrel=1
pkgdesc="A minimalist image viewer based on Leaflet.js and Electron."
arch=("x86_64")
url="https://github.com/sprout2000/leafview"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron27'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/sprout2000/leafview/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('9d4ae0a72ca6a644914e1d57428e0afdfa3b768d24feaffffc1e893c66c780a6'
            'f172a0a7953ce3cda2b0cb38f6a3d28e7dfa9824a8c62de981520af32b9c138f'
            '5735f93904fd117683d262d02b68075f1e779cf9130184f3cdfce5875e17e859')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}