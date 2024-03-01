# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=eshelper
pkgname="eusoft-${_pkgname}-bin"
pkgver=2024.02.27
pkgrel=1
pkgdesc="西班牙语助手,权威的西班牙语词典软件,西班牙语学习者必备的工具.支持学习笔记、生词本多平台同步，让你随时随地学西班牙语."
arch=('x86_64')
url="https://www.esdict.cn/"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
options=('!strip')
depends=(
    'alsa-lib'
    'gtk3'
    'aalib'
    'cdparanoia'
    'graphene'
    'gst-plugins-bad-libs'
    'gst-plugins-base-libs'
    'gstreamer'
    'lame'
    'libavc1394'
    'libcaca'
    'libdv'
    'libgudev'
    'libiec61883'
    'libogg'
    'libpulse'
    'libraw1394'
    'libshout'
    'libsoup'
    'libtheora'
    'libvorbis'
    'libxv'
    'mpg123'
    'nss'
    'openssl-1.0'
    'opus'
    'orc'
    'pipewire-jack'
    'speex'
    'twolame'
    'v4l-utils'
    'wavpack'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://www.eudic.net/download/${_pkgname}.deb?v=${pkgver//./-}"
    "LICENSE.html::https://dict.eudic.net/home/privacy"
    "${pkgname%-bin}.sh"
)
sha256sums=('59af3b48c1cda58220e303c479d8244257fb2d7c7be7d229b83f3e8dc23ee358'
            '21e001fde21fdd190dd3fd47ca496be4bd945955d96f0987bccf059e5643b344'
            '0ed2b777bd6eaf7986a79e6cbf63f067ff135298f9a8c6f8d9eb671b50c5ec86')
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
