# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=polyglot
pkgname="${_pkgname}-ai-bin"
pkgver=0.3.5
pkgrel=1
pkgdesc="Based on ChatGPT and Azure artificial intelligence language models as underlying services, aiming to provide an easy-to-use language practice platform for multilingual speaking practice"
arch=("x86_64")
url="https://polyglotai.xyz/"
_githuburl="https://github.com/liou666/polyglot"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname//p/P}_${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('13005a377d031ffc6c7227ebaed49c2d90b221e7eb15164ed0e45f0a29e42959'
            '49b84995e387881f23b6440123d5ed5241f2176b93d77bf53fd669654c16defd')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    gendesk -q -f -n --pkgname="${_pkgname}-ai-bin" --categories "Education" --name "${_pkgname//p/P}" --exec "${pkgname%-bin}" --pkgdesc "${pkgdesc}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}