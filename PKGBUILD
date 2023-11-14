# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=qaxbrowser
_pkgname="${_appname}-safe-stable"
pkgname=qianxin-browser-stable
pkgver=1.0.45335.7
pkgrel=1
pkgdesc="奇安信可信浏览器国密开发者专版"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://www.qianxin.com/product/detail/pid/333"
_downloadurl="https://dl.qianxin.com/c8a52014-99d3-57ff/%E5%9B%BD%E5%AF%86%E5%BC%80%E5%8F%91%E8%80%85%E4%B8%93%E7%89%88231023"
license=('custom')
conflicts=("${pkgname%-stable}" "${_pkgname%-stable}" "${_pkgname%-safe-stable}")
depends=(
    'at-spi2-core'
    'libx11'
    'systemd-libs'
    'gdk-pixbuf2'
    'mesa'
    'libxrandr'
    'hicolor-icon-theme'
    'libxkbcommon'
    'libdrm'
    'libxext'
    'cairo'
    'libcups'
    'nss'
    'dbus'
    'alsa-lib'
    'libxfixes'
    'libxcb'
    'gtk2'
    'expat'
    'libxcomposite'
    'libxdamage'
    'pango'
    'nspr'
)
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_downloadurl}/${_pkgname}_${pkgver}-1_arm64.deb")
source_armv7h=("${pkgname}-${pkgver}-armv7h.deb::${_downloadurl}/${_pkgname}_${pkgver}-1_arm64.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_downloadurl}/${_pkgname}_${pkgver}-1_amd64.deb")
source=("LICENSE.html")
sha256sums=('368c8e1aff7ff8d7b5843e12222e58c6e43fee8aa8d65581b33d65ec48586a43')
sha256sums_aarch64=('ca58ab89b07a67eb61f397066556ba60f42cf648a3bd9239585fe0ab180beda8')
sha256sums_armv7h=('ca58ab89b07a67eb61f397066556ba60f42cf648a3bd9239585fe0ab180beda8')
sha256sums_x86_64=('73095dcd22dd73d42d40a8ad37479e057dcf2b4d602f3d4af861e2c0711cc963')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/bin/${_pkgname}|/opt/${pkgname}/${_appname}|g;s|Icon=${_pkgname%-stable}|Icon=${pkgname}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname%-stable}.desktop"
    sed "s|/opt/qianxin.com/${_appname}/${_pkgname%-stable}|/opt/${pkgname}/${_pkgname%-stable}|g" \
        -i "${srcdir}/usr/share/gnome-control-center/default-apps/${_pkgname%-stable}.xml"
    sed "s|opt/qianxin.com/${_appname}|opt/${pkgname}|g" -i "${srcdir}/usr/share/menu/${_pkgname%-stable}.menu"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/opt/qianxin.com/${_appname}/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/appdata/${_pkgname%-stable}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname%-stable}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${_pkgname%-stable}.xml" \
        "${pkgdir}/usr/share/gnome-control-center/default-apps/${pkgname}.xml"
    install -Dm644 "${srcdir}/usr/share/man/man1/"* -t "${pkgdir}/usr/share/man/man1"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/opt/qianxin.com/${_appname}/product_logo_${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/usr/share/menu/${_pkgname%-stable}.menu" "${pkgdir}/usr/share/menu/${pkgname}.menu"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}