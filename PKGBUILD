# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xpeviewer-bin
pkgver=0.05
pkgrel=1
pkgdesc="PE file viewer/editor for Windows, Linux and MacOS."
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
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 256x256;do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
       -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}