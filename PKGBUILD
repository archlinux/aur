# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Jove Yu <yushijun110@126.com>
pkgname=netease-cloud-music-gtk-bin
_appname=com.gitee.gmg137.NeteaseCloudMusicGtk4
pkgver=2.4.0
pkgrel=1
pkgdesc="Linux 平台下基于 Rust + GTK 开发的网易云音乐播放器"
arch=('x86_64')
url="https://github.com/gmg137/netease-cloud-music-gtk"
license=('GPL-3.0-only')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%-bin}4=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}4"
)
depends=(
    'libadwaita'
    'gst-plugins-base'
    'gst-plugins-good'
)
optdepends=(
    'gst-plugins-bad: extra media codecs'
    'gst-plugins-ugly: extra media codecs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}-ubuntu22.04_${pkgver}-1_amd64.deb"
)
sha256sums=('3461de75b7e7675e6d27e221a96c8e117b40b04a88751ceda834b97d45bf17cf')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|${pkgname%-bin}4|${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/metainfo/${_appname}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}4" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
    install -Dm644 "${srcdir}/usr/share/glib-2.0/schemas/${_appname}.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/symbolic/apps/${_appname}-symbolic.svg" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/${pkgname%-bin}-symbolic.svg"
    install -Dm644 "${srcdir}/usr/share/locale/zh_CN/LC_MESSAGES/${pkgname%-bin}4.mo" -t "${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}4/${pkgname%-bin}4.gresource" -t "${pkgdir}/usr/share/${pkgname%-bin}4"
}