# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=publii-bin
_pkgname=Publii
pkgver=0.42.1
pkgrel=2
pkgdesc="The most intuitive Static Site CMS designed for SEO-optimized and privacy-focused websites."
arch=('x86_64')
url="https://getpublii.com"
_githuburl="https://github.com/GetPublii/Publii"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron22')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/download/${_pkgname}-${pkgver}.deb"
    "${pkgname%-bin}.sh")
sha256sums=('187197bbfcf62f86891b53b54c73c8c6744174f24e215b90b193f4ce18d3665a'
            '4f85a21132a1d2c57a448440636cbca02de7fa0d9b165e84583a926b51086146')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_pkgname} %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}