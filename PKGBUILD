# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chord-bin
_pkgname=chord
pkgver=0.2.40
pkgrel=1
pkgdesc="Chord - A Modern Music Player"
arch=('x86_64')
url="https://github.com/PeterDing/chord"
license=('MIT')
conflicts=()
depends=(
    'nodejs-lts-fermium'
    'alsa-lib'
    'at-spi2-core'
    'gtk3'
    'nss'
)
options=()
source=(
  "${_pkgname}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.pacman"
)
sha512sums=('d2dd6d1f3352f15c59178002ab5112fc37f2aca914f9205c7c06497e2423783a6129959329803496a6694ff50b07929218fba6e4582a497600b548c2b06fe652')

prepare() {
    mv "${srcdir}/opt/${_pkgname}" "${srcdir}/opt/${pkgname}"
    mv "${srcdir}/opt/${pkgname}/${_pkgname}" "${srcdir}/opt/${pkgname}/${pkgname}"
    mv "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${srcdir}/usr/share/applications/${pkgname}.desktop"
    sed 's/chord/chord-bin/g' -i "${srcdir}/usr/share/applications/${pkgname}.desktop"
    for i in 16x16 32x32 48x48 64x64 128x128; do
        mv "${srcdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png" \
            "${srcdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
    done
}

package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname}/resources/app/node_modules/minimist/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for i in 16x16 32x32 48x48 64x64 128x128; do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
