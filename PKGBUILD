# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Jove Yu <yushijun110@126.com>
pkgname=netease-cloud-music-gtk-bin
_appname=com.gitee.gmg137.NeteaseCloudMusicGtk4
pkgver=2.5.2
pkgrel=2
pkgdesc="NetEase Cloud Music Player Based on Rust + GTK in Linux Platform.(Prebuilt version)Linux 平台下基于 Rust + GTK 开发的网易云音乐播放器"
arch=('x86_64')
url="https://github.com/gmg137/netease-cloud-music-gtk"
_dlurl="https://download.opensuse.org/tumbleweed/repo/oss"
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
)
optdepends=(
    'gst-plugins-bad: extra media codecs'
    'gst-plugins-ugly: extra media codecs'
    'gst-plugins-base: extra media codecs'
    'gst-plugins-good: extra media codecs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_dlurl}/x86_64/${pkgname%-bin}-${pkgver}-1.1.${CARCH}.rpm"
    "${pkgname%-bin}-lang-${pkgver}.rpm::${_dlurl}/noarch/${pkgname%-bin}-lang-${pkgver}-1.1.noarch.rpm"
)
sha256sums=('ec1365d89ec09a0b7c3140ab58b18a3f0ac3635346f422f6da9a545ea66cbb3f'
            '25904bf0b6ffa636208ccd8a36ab161cc0514d0f702dfaebfc6591699b5e2195')
prepare() {
    sed -i -e "
        s/${pkgname%-bin}4/${pkgname%-bin}/g
        s/${_appname}/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/usr/share/metainfo/${_appname}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}4" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
    install -Dm644 "${srcdir}/usr/share/glib-2.0/schemas/${_appname}.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/symbolic/apps/${_appname}-symbolic.svg" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/${pkgname%-bin}-symbolic.svg"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}4/${pkgname%-bin}4.gresource" -t "${pkgdir}/usr/share/${pkgname%-bin}4"
    install -Dm644 "${srcdir}/usr/share/locale/zh_CN/LC_MESSAGES/${pkgname%-bin}4.mo" -t "${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES"
}