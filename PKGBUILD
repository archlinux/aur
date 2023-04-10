# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="dooble-bin"
pkgver=2023.04.01
pkgrel=1
pkgdesc="Web browser based on QtWebEngine"
arch=(x86_64)
url="https://textbrowser.github.io/dooble/"
_githuburl="https://github.com/textbrowser/${pkgname%-bin}"
license=('BSD')
depends=('libdrm' 'libxshmfence' 'libcups' 'pango' 'fontconfig' 'xcb-util-wm' 'qt6-webchannel' 'libxkbcommon' \
    'nspr' 'libxkbcommon-x11' 'krb5' 'xcb-util-keysyms' 'glib2' 'libxtst' 'libx11' 'qt6-base' 'expat' 'freetype2' \
    'libxrandr' 'xcb-util-image' 'libxcb' 'gdk-pixbuf2' 'qt6-positioning' 'qt6-webengine' 'wayland' 'qt6-svg' 'libxrender' \
    'gcc-libs' 'alsa-lib' 'libglvnd' 'gtk3' 'libxext' 'dbus' 'unixodbc' 'libxfixes' 'nss' 'zlib' 'libxcomposite' 'glibc' \
    'at-spi2-core' 'hicolor-icon-theme' 'sh' 'libxdamage' 'xcb-util-renderutil' 'qt6-declarative' 'libxkbfile' 'cairo')
optdepends=()
providers=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/Dooble-${pkgver}.tar.gz"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('3728e1262a5a4371d516040694be400cb935f874ddd7628d7b8aa9c0077cd08a'
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
