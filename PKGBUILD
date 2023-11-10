# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xmachoviewer-bin
pkgver=0.04
pkgrel=5
pkgdesc="Mach-O viewer for Windows, Linux and MacOS"
arch=(x86_64)
url="https://horsicq.github.io/#xmachoviewer"
_githuburl="https://github.com/horsicq/XMachOViewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'qt5-base'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_Ubuntu_22.04_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/horsicq/XMachOViewer/${pkgver}/LICENSE"
)
sha256sums=('b39f9470d3b85e84b5123349a25e35ad414371c96d2980ac035780b6f69d2a8b'
            'd0dfc6996d90bc96474a32b5656eec06bf988cdbcfd226f24fcb7a062208e4ee')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    cp -r "${srcdir}/usr/lib" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}