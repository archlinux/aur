# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: zhangkaizhao <zhangkaizhao at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus at seistrup dot dk>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>

pkgname="dooble-bin"
pkgver=2023.07.15
pkgrel=2
pkgdesc="Web browser based on QtWebEngine"
arch=(x86_64)
url="https://textbrowser.github.io/dooble/"
_githuburl="https://github.com/textbrowser/${pkgname%-bin}"
license=('custom')
depends=('dbus' 'gpgme' 'qt6-webengine' 'libglvnd' 'libxshmfence' 'libx11' 'gst-plugins-base-libs' 'bash' 'gdk-pixbuf2' 'libdrm' 'zlib' \
    'libxkbfile' 'libassuan' 'glib2' 'expat' 'krb5' 'qt6-multimedia' 'at-spi2-core' 'libxcb' 'gtk3' 'libxi' 'libxdamage' 'libgpg-error' \
    'sqlite' 'wayland' 'xcb-util-renderutil' 'fontconfig' 'qt6-positioning' 'libxrender' 'qt6-webchannel' 'freetype2' 'libxtst' 'nss' 'xcb-util-cursor' \
    'unixodbc' 'libxfixes' 'glibc' 'libxkbcommon' 'libxrandr' 'qt6-base' 'pango' 'gcc-libs' 'qt6-declarative' 'alsa-lib' 'libxext' 'gstreamer' \
    'xcb-util-image' 'libcups' 'xcb-util-keysyms' 'libxkbcommon-x11' 'xcb-util-wm' 'nspr' 'cairo' 'libxcomposite')
makedepends=('findutils' 'gendesk')
conflicts=("${pkgname%-bin}")
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/Dooble-${pkgver}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/textbrowser/dooble/master/LICENSE")
sha256sums=('b02e95a85082bcc4c12fce1e547ebfacfe24c70a5e98140a15c570030023ecba'
            'c60bf2d6a8bfdf7c7418bba91c6767cbb4b48dccae36dd5d9ffdb48f756815dd')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" -C "${pkgdir}/opt" --gname root --uname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Network" --name "Dooble" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}.sh"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    # Fix incorrect permissions
    find "${pkgdir}" -type f -perm 0664 -print0 | xargs -r0 chmod 0644
    find "${pkgdir}" -type f -perm 0775 -print0 | xargs -r0 chmod 0755
    find "${pkgdir}" -type d            -print0 | xargs -r0 chmod 0755
}
