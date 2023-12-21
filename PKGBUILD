# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=frhelper
pkgname="eusoft-${_pkgname}-bin"
pkgver=2023.12.19
pkgrel=1
pkgdesc="法语助手,权威的法语词典软件,法语学习者必备的工具.支持学习笔记、生词本多平台同步，让你随时随地学法语."
arch=('x86_64')
url="https://www.eudic.net/v4/fr/app/frhelper"
license=('custom')
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
options=('!strip')
depends=(
    'pango'
    'e2fsprogs'
    'taglib'
    'libvorbis'
    'nss'
    'speex'
    'libjpeg-turbo'
    'gdk-pixbuf2'
    'clutter'
    'v4l-utils'
    'harfbuzz'
    'lame'
    'libxdamage'
    'gst-plugins-base-libs'
    'clutter-gst'
    'libsoup'
    'expat'
    'libogg'
    'libpng'
    'gmp'
    'libthai'
    'mesa'
    'gst-plugins-bad-libs'
    'libgudev'
    'gstreamer'
    'libiec61883'
    'cairo'
    'libavc1394'
    'libpulse'
    'util-linux-libs'
    'fontconfig'
    'libtheora'
    'bzip2'
    'libx11'
    'libdrm'
    'libdv'
    'pipewire-jack'
    'libgpg-error'
    'libxfixes'
    'mpg123'
    'cdparanoia'
    'orc'
    'libxext'
    'graphene'
    'libxv'
    'libp11-kit'
    'alsa-lib'
    'libraw1394'
    'libglvnd'
    'freetype2'
    'gtk3'
    'libxcb'
    'opus'
    'openssl-1.0'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://www.eudic.net/download/${_pkgname}.deb?v=${pkgver//./-}"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('ce5fcba8f0a2ffd0bff6b62e63f658883e795577caca130698de799a8647530c'
            '69031e95591a339c4cd9c01547494e23196cea6438608f1f951b493ea8fca54f'
            '1f086c1275263d7be3291f28b211da94187870f88e7437511aa6496ffb7fe99f')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/share/${pkgname%-bin}/AppRun|${pkgname%-bin}|g;s|com.eusoft.${_pkgname}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/com.eusoft.${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}