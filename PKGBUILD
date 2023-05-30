# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: zhangkaizhao <zhangkaizhao at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="dooble-bin"
pkgver=2023.05.31
pkgrel=3
pkgdesc="Web browser based on QtWebEngine"
arch=(x86_64)
url="https://textbrowser.github.io/dooble/"
_githuburl="https://github.com/textbrowser/${pkgname%-bin}"
license=('custom')
depends=('libxshmfence' 'xcb-util-image' 'libxi' 'xcb-util-cursor' 'libxdamage' 'gstreamer' 'freetype2' 'libcups' 'libxcomposite' 'libx11' \
    'qt6-declarative' 'gdk-pixbuf2' 'gcc-libs' 'glibc' 'nspr' 'gtk3' 'at-spi2-core' 'xcb-util-keysyms' 'bash' 'cairo' 'libdrm' \
    'gst-plugins-base-libs' 'libxfixes' 'libglvnd' 'libxcb' 'fontconfig' 'libxkbcommon' 'xcb-util-wm' 'nss' 'alsa-lib' 'dbus' 'qt6-base' \
    'krb5' 'libxkbcommon-x11' 'xcb-util-renderutil' 'glib2' 'libxrandr' 'libxrender' 'wayland' 'libxtst' 'expat' 'libxext' 'zlib' 'libxkbfile' 'pango')
makedepends=('findutils')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/Dooble-${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/textbrowser/dooble/master/LICENSE")
sha256sums=('43c849dbef96a50685fedcdab8179b74bff0035233c13488af094220d50234f2'
            'c60bf2d6a8bfdf7c7418bba91c6767cbb4b48dccae36dd5d9ffdb48f756815dd')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}" -type f -perm 0664 -print0 | xargs -r0 chmod 0644
    find "${pkgdir}" -type f -perm 0775 -print0 | xargs -r0 chmod 0755
    find "${pkgdir}" -type d            -print0 | xargs -r0 chmod 0755
}