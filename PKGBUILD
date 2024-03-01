# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dehelper
pkgname="eusoft-${_pkgname}-bin"
pkgver=2024.02.27
pkgrel=1
pkgdesc="德语助手,权威的德语词典软件,德语学习者必备的工具.支持学习笔记、生词本多平台同步，让你随时随地学德语."
arch=('x86_64')
url="https://www.godic.net/"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=(
    'libvorbis'
    'nss'
    'speex'
    'libjpeg-turbo'
    'gdk-pixbuf2'
    'v4l-utils'
    'harfbuzz'
    'lame'
    'gst-plugins-base-libs'
    'libogg'
    'libpng'
    'gmp'
    'libthai'
    'mesa'
    'gst-plugins-bad-libs'
    'libgudev'
    'gstreamer'
    'libiec61883'
    'libavc1394'
    'libpulse'
    'util-linux-libs'
    'libtheora'
    'bzip2'
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
    'gtk3'
    'opus'
    'openssl-1.0'
    'libdv'
    'aalib'
    'libshout'
    'twolame'
    'libsoup'
    'wavpack'
    'libcaca'
)
options=("!strip")
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://www.eudic.net/download/${_pkgname}.deb?v=${pkgver//./-}"
    "LICENSE.html::https://dict.eudic.net/home/privacy"
    "${pkgname%-bin}.sh"
)
sha256sums=('fc47e56b3907522a8d3dbd906a4e4117991e0aed772c08547b0214c8b08fcccc'
            '21e001fde21fdd190dd3fd47ca496be4bd945955d96f0987bccf059e5643b344'
            'c68de8f6be6059bc0019b5d2ef43edfabe15bd2c213d671ca39ed69ae0619c66')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
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