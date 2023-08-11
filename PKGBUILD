# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=frhelper
pkgname="eusoft-${_appname}-bin"
pkgver=8.9
pkgrel=1
pkgdesc="法语助手,权威的法语词典软件,法语学习者必备的工具.支持学习笔记、生词本多平台同步，让你随时随地学法语."
arch=('x86_64')
url="https://www.eudic.net/v4/fr/app/frhelper"
license=('custom')
conflicts=("${pkgname%-bin}" "${_appname}")
depends=('pango' 'e2fsprogs' 'taglib' 'libvorbis' 'nss' 'speex' 'libjpeg-turbo' 'gdk-pixbuf2' 'clutter' 'v4l-utils' 'harfbuzz' 'lame' 'libxdamage' \
    'gst-plugins-base-libs' 'gcc-libs' 'clutter-gst' 'libsoup' 'expat' 'libogg' 'libpng' 'gmp' 'libthai' 'glib2' 'mesa' 'gst-plugins-bad-libs' \
    'libgudev' 'glibc' 'gstreamer' 'libiec61883' 'cairo' 'libavc1394' 'libpulse' 'util-linux-libs' 'fontconfig' 'bash' 'libtheora' 'bzip2' 'libx11' \
    'libdrm' 'libdv' 'pipewire-jack' 'libgpg-error' 'libxfixes' 'mpg123' 'cdparanoia' 'orc' 'libxext' 'graphene' 'libxv' 'libp11-kit' 'alsa-lib' \
    'libraw1394' 'libglvnd' 'freetype2' 'gtk3' 'libxcb' 'opus' 'zlib')
source=("${pkgname%-bin}-${pkgver}.deb::https://www.eudic.net/download/${_appname}.deb?v=2023-06-06"
    "LICENSE.html")
sha256sums=('7dff64d89d70f96f8fe0e80d91cd55fb67c22b3b5f77c7c589de68ba19281422'
            '69031e95591a339c4cd9c01547494e23196cea6438608f1f951b493ea8fca54f')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/usr/share|/opt|g;s|com.eusoft.${_appname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/com.eusoft.${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed "s|usr/share|opt|g" -i "${pkgdir}/opt/${pkgname%-bin}/AppRun"
}