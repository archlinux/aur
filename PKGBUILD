# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="gotify-tray-bin"
pkgver=0.5.0
pkgrel=2
pkgdesc="Cross-platform desktop client for receiving messages from a Gotify server"
arch=('x86_64')
url="https://github.com/seird/gotify-tray"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('gcc-libs' 'libmd' 'pcre2' 'fribidi' 'libxcursor' 'sqlite' 'libbsd' 'libcap' 'glibc' 'libxcb' 'libffi' 'keyutils' 'fontconfig' 'gdk-pixbuf2' \
    'harfbuzz' 'krb5' 'libpng' 'pixman' 'zlib' 'expat' 'libxfixes' 'python' 'libxi' 'libjpeg-turbo' 'libxext' 'python-pyqt6' 'libglvnd' 'libxdamage' \
    'graphite' 'cairo' 'libxcomposite' 'lz4' 'glib2' 'pango' 'dbus' 'libxrandr' 'util-linux-libs' 'xcb-util-keysyms' 'xcb-util-renderutil' 'openssl' \
    'libxrender' 'libdrm' 'e2fsprogs' 'qt6-base' 'libgpg-error' 'wayland' 'libepoxy' 'zstd' 'xcb-util-wm' 'bzip2' 'libthai' 'at-spi2-core' 'systemd-libs' \
    'libxinerama' 'xcb-util-cursor' 'xcb-util-image' 'libxkbcommon' 'brotli' 'xz' 'libxkbcommon-x11' 'gtk3' 'libx11' 'libgcrypt' 'libdatrie' 'freetype2')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_amd64_debian_bullseye.deb")
sha256sums=('f01b21fd84e6d96afecc11759970199c82eecea76557c638611601235e230a4d')
  
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/usr/lib/"* "${pkgdir}/opt"
    sed "s|Path=/usr/lib/${pkgname%-bin}|Path=/opt/${pkgname%-bin}|g;s|Exec=/usr/lib/${pkgname%-bin}/${pkgname%-bin}|Exec=${pkgname%-bin}|g;s|Icon=/usr/share/icons/${pkgname%-bin}.ico|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/gotifytray.desktop"
    rm -rf "${srcdir}/usr/share/icons"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/gotify_tray/gui/images/tray.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}