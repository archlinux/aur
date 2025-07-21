# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=frhelper
pkgname="eusoft-${_pkgname}-bin"
pkgver=11.6.0
pkgrel=1
pkgdesc="Authoritative French dictionary software, an essential tool for French learners.(Prebuilt version)法语助手,权威的法语词典软件,法语学习者必备的工具."
arch=('x86_64')
url="https://www.eudic.net/v4/fr/app/frhelper"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
options=('!strip')
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
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://www.eudic.net/download/${_pkgname}.deb?v=${pkgver//./-}"
    "LICENSE.html::https://dict.eudic.net/home/privacy"
    "${pkgname%-bin}.sh"
)
sha256sums=('ce5fcba8f0a2ffd0bff6b62e63f658883e795577caca130698de799a8647530c'
            'a961d77963997afda7147235ae0540912aa8300d9ccdf2dddf90f1893045adac'
            '07aefce5b6c9dce4fec424cfb3d1c2456680d6936e62651484253a031c921db9')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@appasar@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/usr\/share\/${pkgname%-bin}\/AppRun/${pkgname%-bin}/g
        s/com.eusoft.${_pkgname}/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/com.eusoft.${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
