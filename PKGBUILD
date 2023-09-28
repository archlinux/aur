# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=leafview-bin
_pkgname=LeafView
pkgver=2.6.4
pkgrel=1
pkgdesc="A minimalist image viewer based on Leaflet.js and Electron."
arch=("x86_64")
url="https://github.com/sprout2000/leafview"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/sprout2000/leafview/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('1f320978ca10ca9bdfe70f28453d1156a109ffa761a82e526ce1c151db78cea5'
            'f172a0a7953ce3cda2b0cb38f6a3d28e7dfa9824a8c62de981520af32b9c138f'
            'f82f53478b857c64d80fdbf56e24b9abef7961b13b60dd67a926a326b3934c33')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}