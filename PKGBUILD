# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: bacteriostat <dev.bacteriostat at aleeas dot com>
# Contributor: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
pkgname=spotiflyer-bin
_pkgname=SpotiFlyer
pkgver=3.6.3
pkgrel=8
pkgdesc="Kotlin Multiplatform Music Downloader, Supports Spotify / Gaana / Youtube Music / Jio Saavn / SoundCloud."
arch=('x86_64')
url="https://soundbound.shabinder.in/install"
_ghurl="https://github.com/Shabinder/SpotiFlyer"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'ffmpeg'
    'fontconfig'
    'libx11'
    'libxtst'
    'libglvnd'
    'libxext'
    'libxi'
    'libxrender'
    'java-runtime'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9038e09d4e4d0eff02bbb10fc02728f11e73e46973e23297d0ff189dfdce0aae'
            'cd091431c99c2b54d820b854b96b6986831eba021ae2cc20b6526f58dfcc7e34')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${pkgname%-bin}/bin/${_pkgname}|${pkgname%-bin}|g;s|/opt/${pkgname%-bin}/lib/${_pkgname}.png|${pkgname%-bin}|g;s|Unknown|AudioVideo;|g" \
        -i "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}