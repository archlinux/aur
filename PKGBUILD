# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xpeviewer-bin
pkgver=0.04
pkgrel=8
pkgdesc="PE file viewer/editor for Windows, Linux and MacOS."
arch=(x86_64)
url="http://ntinfo.biz/"
_ghurl="https://github.com/horsicq/XPEViewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_Ubuntu_22.04_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/horsicq/XPEViewer/${pkgver}/LICENSE"
)
sha256sums=('9244a20b48c1ffa4be7d8d2714ff47f72a40bbecbd00ee6398754ed2e505f25c'
            'd0dfc6996d90bc96474a32b5656eec06bf988cdbcfd226f24fcb7a062208e4ee')
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