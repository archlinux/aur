# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=novelwriter-bin
_pkgname=novelWriter
pkgver=2.7.3
_pyver=3.13
pkgrel=1
pkgdesc="A markdown-like document editor for writing novels.(Prebuilt version)"
arch=('x86_64')
url="https://novelwriter.io/"
_ghurl="https://github.com/vkbo/novelWriter"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'python'
    'python-setuptools'
    'python-pyenchant'
    'python-importlib-metadata'
    'python-pyqt6'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_all.deb"
)
sha256sums=('53f723fd46f72b35067d98b49d776c64bff9264f7b840f9554148c15770abef8')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/lib/python${_pyver}/site-packages"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/python3/dist-packages/"* "${pkgdir}/usr/lib/python${_pyver}/site-packages"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}."* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons/}/apps"
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/mimetypes/application-x-${pkgname%-bin}-project."* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons/}/mimetypes"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/"* -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
