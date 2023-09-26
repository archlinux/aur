# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gotify-tray-bin
_pkgname=gotify_tray
pkgver=0.5.2
pkgrel=2
pkgdesc="Cross-platform desktop client for receiving messages from a Gotify server"
arch=('x86_64')
url="https://github.com/seird/gotify-tray"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gcc-libs' 'libmd' 'pcre2' 'fribidi' 'libxcursor' 'sqlite' 'libbsd' 'libcap' 'glibc' 'libxcb' 'libffi' 'keyutils' 'fontconfig' 'gdk-pixbuf2' \
    'harfbuzz' 'krb5' 'libpng' 'pixman' 'zlib' 'expat' 'libxfixes' 'libxi' 'qt6-webengine' 'libjpeg-turbo' 'libxext' 'python-pyqt6' 'libglvnd' 'libxdamage' \
    'graphite' 'cairo' 'libxcomposite' 'lz4' 'glib2' 'pango' 'dbus' 'libxrandr' 'util-linux-libs' 'xcb-util-keysyms' 'xcb-util-renderutil' 'openssl' \
    'libxrender' 'libdrm' 'e2fsprogs' 'qt6-base' 'libgpg-error' 'wayland' 'libepoxy' 'zstd' 'xcb-util-wm' 'bzip2' 'libthai' 'at-spi2-core' 'systemd-libs' \
    'libxinerama' 'xcb-util-cursor' 'xcb-util-image' 'libxkbcommon' 'brotli' 'xz' 'libxkbcommon-x11' 'gtk3' 'libx11' 'libgcrypt' 'libdatrie' 'freetype2' \
    'qt6-svg' 'qt6-wayland' 'libselinux')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64_bullseye.deb")
sha256sums=('28a6a47b22e3613c813e955ad66cfd422c0da9be6d8cbedf5904a1bab8d49bbf')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|Exec=${pkgname%-bin}|g;s|Icon=/usr/share/icons/${pkgname%-bin}.ico|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname//_/}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//_/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname}/gui/images/tray.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}