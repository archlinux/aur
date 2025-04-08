# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ucm-desktop-bin
_pkgname='UCM Desktop'
pkgver=1.0.0
pkgrel=2
pkgdesc="A desktop app companion to the UCM CLI.(Prebuilt version)"
arch=('x86_64')
url="https://unison-lang.org/"
_ghurl="https://github.com/unisonweb/ucm-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'ucm-bin'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/app-v${pkgver}/${_pkgname// /.}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/unisonweb/ucm-desktop/app-v${pkgver}/LICENSE"
)
sha256sums=('b481e4b15d560bb050771aacee4c226447eb7da0fa7c192a3791c3615a4c6152'
            '1a6dcace03c9ae60da5594e77bff3207de150a7e1b257b43f3ba53b21a6b2b3a')
prepare() {
    sed -i "s/Categories=/Categories=Development;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}