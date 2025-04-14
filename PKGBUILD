# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ytm-dlp
pkgname="${_pkgname}-gui-bin"
pkgver=1.3.3
_electronversion=26
pkgrel=3
pkgdesc="An ElectronJS app for downloading music off Youtube Music.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/RENOMIZER/ytm-dlp-gui"
license=('Unlicense')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}-${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/RENOMIZER/ytm-dlp-gui/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('0c350d3207b8eea26e5d18dbf4ca9f54bcbb2428982c60edc74de4f81328d0b6'
            '2808073b5ff6a6b6f653ef61c6154b545c2dc47f5026683ae5e72c7c3d5632f6'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/Audio;/AudioVideo;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}