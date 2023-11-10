# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dopamine-bin
_pkgname=Dopamine
pkgver=3.0.0_preview21
pkgrel=1
pkgdesc="The audio player that keeps it simple"
arch=('x86_64')
url="https://github.com/digimezzo/dopamine"
license=("GPL3")
depends=(
    'bash'
    'electron21'
    'hicolor-icon-theme'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_21/.21}.pacman"
    "${pkgname%-bin}.sh"
)
sha256sums=('d72bae6d88c09970e8a176a347d1fd6e8c70526bdea71f56dfc759979e767129'
            '99985e02c47148d483491d485afa825ba5045ee1208f7ced6d41958eb386f09a')
build() {
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}