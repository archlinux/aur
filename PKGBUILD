# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=eudic
pkgname="eusoft-${_pkgname}-bin"
pkgver=2023.06.06
pkgrel=2
pkgdesc="权威的英语词典软件,英语学习者必备的工具,支持学习笔记、生词本多平台同步,让你随时随地学英语."
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('custom')
provides=("${_pkgname}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
options=('!strip')
depends=('zlib' 'glibc' 'bzip2' 'gcc-libs' 'libraw1394' 'libxv' 'speex' 'util-linux-libs' 'libjpeg-turbo' 'cairo' 'cdparanoia' 'libpulse' \
    'libvorbis' 'pango' 'opus' 'libx11' 'libavc1394' 'orc' 'clutter-gst' 'gst-plugins-base-libs' 'mpg123' 'gdk-pixbuf2' 'libdv' 'expat' 'bash' \
    'freetype2' 'libxcb' 'clutter' 'gst-plugins-bad-libs' 'v4l-utils' 'harfbuzz' 'libgpg-error' 'libpng' 'libxdamage' 'libdrm' 'libxext' \
    'pipewire-jack' 'libthai' 'mesa' 'fontconfig' 'libgudev' 'lame' 'libsoup' 'gmp' 'gtk3' 'alsa-lib' 'glib2' 'libxfixes' 'gstreamer' 'graphene' \
    'libtheora' 'libglvnd' 'libogg' 'nss' 'e2fsprogs' 'taglib' 'libiec61883' 'libp11-kit')
source=("${pkgname%-bin}-${pkgver}.deb::https://www.eudic.net/download/${_pkgname}.deb?v=${pkgver//./-}"
    "LICENSE.html")
sha256sums=('8e992161c4eb206cf9fda39772f5e2ec3cd1d11d344e3666f3f890e1ee330ba9'
            '8254fc6f96e7362405da60a8ece9d86ad26066b5edac10e775aca4e6d7c0979f')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/share|/opt|g;s|com.eusoft.${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed "s|/usr/share/${pkgname%-bin}/AppRun|${pkgname%-bin}|g;s|usr/share|opt|g" -i "${srcdir}/usr/share/${pkgname%-bin}/AppRun"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/AppRun" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/com.eusoft.${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}