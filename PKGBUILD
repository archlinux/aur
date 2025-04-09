# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xpeviewer-bin
pkgver=0.05
pkgrel=2
pkgdesc="PE file viewer/editor.(Prebuilt version.Use system-wide electron)"
arch=(x86_64)
url="http://ntinfo.biz/"
_ghurl="https://github.com/horsicq/XPEViewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'qt5-script'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_Ubuntu_24.04_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/horsicq/XPEViewer/${pkgver}/LICENSE"
)
sha256sums=('ba84aea61cff98d419a7a7ef15d95a22e2cbae51a6181afd9e09cffac832b4be'
            'a13f51e91aa614abee0dd876d57e68f94f37bd16fd37c112a394d15961ac6bf1')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 256x256)
    for _icons in "${_icon_sizes[@]}";do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}