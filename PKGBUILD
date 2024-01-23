# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lyrically-bin
_pkgname=Lyrically
pkgver=0.1.0
_electronversion=28
pkgrel=1
pkgdesc="Music player inspired by Lyric Speaker"
arch=('x86_64')
url="https://github.com/CyanSalt/lyrically"
license=('ISC')
conflits=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/CyanSalt/lyrically/v${pkgver}/resources/images/icon.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/CyanSalt/lyrically/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('423c5e3763a68294fec232086f024ef5450df8880ac9cf01352d760bba78a214'
            'ab219244090109bd4c111ee2f8d574337bc668860f9e9678190f4591df4dec1a'
            '9950b2ef9948d119f67c09e78478be5c96db2028bebf735ee60a9e3c5afe0bc0'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}