# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fxradio
_pkgname=FXRadio
pkgver=0.18.2
pkgrel=3
pkgdesc="Internet radio directory for desktop written in tornadofx"
arch=('any')
url="http://hudacek.online/fxradio"
_ghurl="https://github.com/Joseph5610/fxradio"
license=('AGPL3')
conflicts=("${pkgname}")
depends=(
    'vlc'
    'java-runtime'
    'libxtst'
    'gtk3'
    'gtk2'
    'giflib'
    'pango'
    'freetype2'
    'libx11'
    'libxext'
    'lcms2'
    'cairo'
    'libxi'
    'libjpeg-turbo'
    'gdk-pixbuf2'
    'libpng'
    'alsa-lib'
    'libxrender'
    'libglvnd'
    'ffmpeg4.4'
    'harfbuzz'
)
makedepends=('jdk-openjdk>=20')
source=("${pkgname}-${pkgver}.zip::${_ghurl}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('fe0633aec74661c21c4a12dd1b5943b91f8d337700ed78f74fc7b16e21999606')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./gradlew jfxNative
    sed "s|/opt/${_pkgname}/${_pkgname} %U|${pkgname} %U|g;s|/opt/${_pkgname}/${_pkgname}.png|${pkgname}|g;s|Utility|AudioVideo;|g" \
        -i "${srcdir}/opt/${pkgname}/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/build/jfx/native/${_pkgname}/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}