# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=eshelper
pkgname="eusoft-${_pkgname}-bin"
pkgver=2023_06_06
pkgrel=2
pkgdesc="西班牙语助手,权威的西班牙语词典软件,西班牙语学习者必备的工具.支持学习笔记、生词本多平台同步，让你随时随地学西班牙语."
arch=('x86_64')
url="https://www.esdict.cn/"
license=('custom')
conflicts=("${pkgname%-bin}" "${_pkgname}")
options=('!strip')
depends=('pango' 'e2fsprogs' 'taglib' 'libvorbis' 'nss' 'speex' 'libjpeg-turbo' 'gdk-pixbuf2' 'clutter' 'v4l-utils' 'harfbuzz' 'lame' 'libxdamage' \
    'gst-plugins-base-libs' 'gcc-libs' 'clutter-gst' 'libsoup' 'expat' 'libogg' 'libpng' 'gmp' 'libthai' 'glib2' 'mesa' 'gst-plugins-bad-libs' \
    'libgudev' 'glibc' 'gstreamer' 'libiec61883' 'cairo' 'libavc1394' 'libpulse' 'util-linux-libs' 'fontconfig' 'bash' 'libtheora' 'bzip2' 'libx11' \
    'libdrm' 'libdv' 'pipewire-jack' 'libgpg-error' 'libxfixes' 'mpg123' 'cdparanoia' 'orc' 'libxext' 'graphene' 'libxv' 'libp11-kit' 'alsa-lib' \
    'libraw1394' 'libglvnd' 'freetype2' 'gtk3' 'libxcb' 'opus' 'zlib')
source=("${pkgname%-bin}-${pkgver}.deb::https://www.eudic.net/download/${_pkgname}.deb?v=${pkgver//_/-}"
    "LICENSE.html")
sha256sums=('7f8a7a408a85247634620bb28e9ed2066fb98503923517c10e3b8acf4031c0db'
            'bb199c3faf0e1155a5bc43512e1898e6604034a67d9e2f4d16840b3b359cc432')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/share/${pkgname%-bin}/AppRun|${pkgname%-bin}|g;s|com.eusoft.${_pkgname}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed "s|usr/share|opt|g" -i "${srcdir}/usr/share/${pkgname%-bin}/AppRun"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/AppRun" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/com.eusoft.${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}