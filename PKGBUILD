# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=feiyu-desktop-bin
_zhsname='飞鱼'
pkgver=2.2.0
pkgrel=1
pkgdesc="A cross-platform video player that is so beautiful that it doesn't seem like a powerhouse.(Prebuilt version)"
arch=('x86_64')
url="https://feiyu-player.xbox.work/"
_ghurl="https://github.com/idootop/feiyu-player"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-desktop-bin}_${pkgver}_linux_${CARCH}.deb"
)
sha256sums=('133fb2475cabba51d3a43cba72fdf26704ffbcfaa2228f1086ac9d97246a4051')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Categories=/Categories=AudioVideo/g
        s/Name=${_zhsname}/Name=${pkgname%-bin}/g
        6i\Name[zh_CN]=${_zhsname}
    " "${srcdir}/usr/share/applications/${_zhsname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_zhsname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}