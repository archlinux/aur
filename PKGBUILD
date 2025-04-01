# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lavascope-bin
_pkgname=LavaScope
pkgver=0.1.2
pkgrel=1
pkgdesc="A cross-platform GUI tool to monitor and manage firewall rules.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/ChaserZ98/lavascope"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ChaserZ98/lavascope/${pkgver}/LICENSE"
)
sha256sums=('3b073cefbaf43d46e63c92a657cd58eb3d79a0889f2bc8acb2bddd6cf3904a1c'
            '730e9114f7b8b46d400ae0d80d76f2fb809d096555251f91593733b56efdd084')
prepare() {
    sed -i "s/Comment=${_pkgname}/Comment=${pkgdesc}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
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