# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="dooble-bin"
pkgver=2023.04.20
pkgrel=1
pkgdesc="Web browser based on QtWebEngine"
arch=(x86_64)
url="https://textbrowser.github.io/dooble/"
_githuburl="https://github.com/textbrowser/${pkgname%-bin}"
license=('custom')
depends=('libdrm' 'libcups' 'pango' 'xcb-util-wm' 'qt6-webchannel' 'libxkbcommon' 'sqlite' 'dbus' 'libxi' 'libxfixes' 'fontconfig' \
    'nspr' 'libxkbcommon-x11' 'krb5' 'xcb-util-keysyms' 'glib2' 'libx11' 'qt6-base' 'expat' 'freetype2' 'xcb-util-cursor' 'libxtst' \
    'libxrandr' 'xcb-util-image' 'libxcb' 'gdk-pixbuf2' 'qt6-positioning' 'qt6-webengine' 'wayland' 'qt6-svg' 'libxrender' 'qt6-multimedia' \
    'gcc-libs' 'libglvnd' 'gtk3' 'libxext' 'unixodbc' 'nss' 'zlib' 'glibc' 'gstreamer' 'libxcomposite' 'libxkbfile' 'alsa-lib' 'libxshmfence' \
    'at-spi2-core' 'sh' 'xcb-util-renderutil' 'qt6-declarative' 'cairo' 'gst-plugins-base-libs' 'libxdamage' 'qt6-tools' 'qt6-serialport')
optdepends=()
makedenpends=()
providers=()
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/Dooble-${pkgver}.tar.gz"
    "LICENSE::${_githuburl}/raw/master/LICENSE"
    "${pkgname%-bin}.desktop::${_githuburl}/raw/master/${pkgname%-bin}.desktop")
sha256sums=('cb178f0360cabc391cb6f14b500a07f455b6df4dccbea8fe70a3ecf4b17d8b56'
            'c60bf2d6a8bfdf7c7418bba91c6767cbb4b48dccae36dd5d9ffdb48f756815dd'
            '47d89913aa236e93346ad59ee5855597dc85363b5d4229b899127f0cd3ebded0')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    bsdtar -xf "${pkgname%-bin}-${pkgver}.tar.gz" -C "${pkgdir}/opt" --gname root --uname root
    find "${pkgdir}/opt" -type d -exec chmod 755 {} \;
    chmod -x "${pkgdir}/opt/dooble/Lib/libQt6WebEngineCore.so.6"
    #Use system libc.so.6
    mv "${pkgdir}/opt/${pkgname%-bin}/Lib/libc.so.6" "${pkgdir}/opt/${pkgname%-bin}/Lib/libc.so.6.bak"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed 's|/usr/bin/dooble|/opt/dooble/dooble.sh|g' -i "${srcdir}/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}