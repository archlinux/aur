# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dehelper
pkgname="eusoft-${_pkgname}-bin"
pkgver=2025.02.14
pkgrel=1
pkgdesc="Authoritative German dictionary software, an essential tool for German learners.(Prebuilt version)德语助手,权威的德语词典软件,德语学习者必备的工具."
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
            'c1e3d51d4ba72bf9f6f5860c4e840d91befe35b4a1a6b3581780c69a73a748d6'
            '07aefce5b6c9dce4fec424cfb3d1c2456680d6936e62651484253a031c921db9')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@appasar@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\/usr\/share\/${pkgname%-bin}\/AppRun/${pkgname%-bin}/g
        s/com.eusoft.${_pkgname}/${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/com.eusoft.${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}