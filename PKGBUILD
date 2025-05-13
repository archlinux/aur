# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagenie-bin
_pkgname=Imagenie
pkgver=0.2.2
pkgrel=2
pkgdesc="AI-powered desktop app for stunning image transformations.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/zhongweili/imagenie"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/app-v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/zhongweili/imagenie/app-v${pkgver}/LICENSE"
)
sha256sums=('08acba9417788dbefd8a016fd319c4321385099982c1064e8185ba7cb456ef70'
            '7e63113a957314b982f46623bdaf855ddba75824b9a6a50c25a1eb5bf362a43b')
prepare() {
    sed -i -e "
        s/Categories=/Categories=Graphics;/g
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}