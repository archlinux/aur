# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rickrack-bin
_pkgname=Rickrack
pkgver=2.8.40
pkgrel=2
pkgdesc="Generate harmonious colors freely.焰火十二卷(实时色彩工具箱)是一款免费且实用的色彩编辑器."
arch=('x86_64')
url="https://eigenmiao.com/rickrack/"
_githuburl="https://github.com/eigenmiao/Rickrack"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=('libgpg-error' 'libdatrie' 'libdrm' 'qt5-sensors' 'dbus' 'qt5-declarative' 'glibc' 'qt5-x11extras' 'libxfixes' 'qt5-xmlpatterns' 'gdk-pixbuf2' \
    'mesa' 'pixman' 'libxcomposite' 'libidn11' 'cairo' 'gmp' 'libxext' 'graphite' 'libtasn1' 'qt5-wayland' 'libcups' 'gcc-libs' 'fontconfig' 'qt5-svg' \
    'libxkbcommon-x11' 'xcb-util-keysyms' 'libxkbcommon' 'xz' 'libxdamage' 'qt5-base' 'libxrandr' 'hicolor-icon-theme' 'libxft' 'krb5' 'wayland' \
    'qt5-webchannel' 'xcb-util' 'libxcursor' 'at-spi2-core' 'libx11' 'keyutils' 'unixodbc' 'orc' 'libxss' 'libselinux' 'libglvnd' 'glib2' 'gnutls' \
    'zlib' 'qt5-websockets' 'gtk3' 'alsa-lib' 'libxrender' 'libpulse' 'gst-plugins-base-libs' 'tk' 'avahi' 'libthai' 'expat' 'libxshmfence' 'libp11-kit' \
    'fcitx-qt5' 'libepoxy' 'libxi' 'systemd-libs' 'xcb-util-renderutil' 'gstreamer' 'tcl' 'pango' 'harfbuzz' 'libxcb' 'qt5-location' 'qt5-multimedia' \
    'libgcrypt' 'e2fsprogs' 'libxinerama' 'xcb-util-image' 'freetype2' 'xcb-util-wm')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Rickrack_v${pkgver}_en_linux_x86_64.deb")
sha256sums=('59b7e0bec55e313e0811d7d2ff807aa6a3574a78181ccb31d91ffc08fd215c3d')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|/opt/${_pkgname}/${_pkgname}|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/mimetypes/"*.png \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/mimetypes"
    done
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
}