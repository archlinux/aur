# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="dooble-bin"
pkgver=2023.04.10
pkgrel=2
pkgdesc="Web browser based on QtWebEngine"
arch=(x86_64)
url="https://textbrowser.github.io/dooble/"
_githuburl="https://github.com/textbrowser/${pkgname%-bin}"
license=('BSD')
depends=('libdrm' 'libcups' 'pango' 'xcb-util-wm' 'qt6-webchannel' 'libxkbcommon' 'gendesk' 'libpng' 'zstd' 'libgpg-error' 'libmd' 'sqlite' 'util-linux-libs' \
    'nspr' 'libxkbcommon-x11' 'krb5' 'xcb-util-keysyms' 'glib2' 'libx11' 'qt6-base' 'expat' 'freetype2' 'xcb-util-cursor' 'libbsd' 'systemd-libs' \
    'libxrandr' 'xcb-util-image' 'libxcb' 'gdk-pixbuf2' 'qt6-positioning' 'qt6-webengine' 'wayland' 'qt6-svg' 'libxrender' 'qt6-multimedia' \
    'gcc-libs' 'libglvnd' 'gtk3' 'libxext' 'unixodbc' 'nss' 'zlib' 'glibc' 'libcap' 'keyutils' 'brotli' 'libgcrypt' 'gstreamer' 'e2fsprogs' \
    'at-spi2-core' 'hicolor-icon-theme' 'sh' 'xcb-util-renderutil' 'qt6-declarative' 'cairo' 'lz4' 'libxdmcp' 'xz' 'libxau' 'gst-plugins-base-libs')
optdepends=()
providers=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/Dooble-${pkgver}.tar.gz"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('4319930c885516b3f3ef2b1a5e5d98584c5c725a5aa6b5e267d8d90e908ab3e5'
            'c60bf2d6a8bfdf7c7418bba91c6767cbb4b48dccae36dd5d9ffdb48f756815dd')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    bsdtar -xf "${pkgname%-bin}-${pkgver}.tar.gz" -C "${pkgdir}/opt" --gname root --uname root
    find "${pkgdir}/opt" -type d -exec chmod 755 {} \;
    chmod -x "${pkgdir}/opt/dooble/Lib/libQt6WebEngineCore.so.6"
    #Use system libc.so.6
    mv "${pkgdir}/opt/${pkgname%-bin}/Lib/libc.so.6" "${pkgdir}/opt/${pkgname%-bin}/Lib/libc.so.6.bak"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.png"
    gendesk -f --pkgname "${pkgname%-bin}" --pkgdesc "Web browser based on QtWebEngine" --icon "${pkgname%-bin}" \
        --categories "Network;WebBrowser" --name "Dooble Web Browser" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}.sh"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}