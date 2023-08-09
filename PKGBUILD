# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=numara-bin
_appname=Numara
pkgver=4.0.2
pkgrel=1
pkgdesc="Simple notepad calculator built on Electron, powered by Math.js"
arch=('x86_64')
url="https://numara.io/"
_githuburl="https://github.com/bornova/numara-calculator"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/bornova/numara-calculator/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('081713e2c45f51c77788c6bc21e6c12d0eaba50347913ac6a2ef4c1b06f44e17'
            'b944c7642b6a0ccf0c24e98d199d8bf4c8d556ebc7d87ddb9af98cab67b378b5'
            'd6ac2b37886ead08ceb845e76a7ca281492b3f7158e6b6e28035d206c1093f1f')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}