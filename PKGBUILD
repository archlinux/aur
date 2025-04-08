# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=qro-crown
pkgname="${_appname//-/}-bin"
_pkgname=QroCrown
pkgver=1.3.1
pkgrel=2
pkgdesc="An enhanced launcher for keeping your games. By QRodEX for QRodEXers.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/Qrodex/QroCrown"
license=('AGPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'wine'
    'winetricks'
    'gtk3'
    'webkit2gtk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/app-v${pkgver}/${_appname}_${pkgver}_amd64.deb"
)
sha256sums=('2003bd658645e19ab51ce110c0d9564273a7d372d3e78ab3a14b5083039d9ef9')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Development/Game/g" "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}