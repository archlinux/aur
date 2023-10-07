# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=numara-bin
_appname=Numara
pkgver=4.0.8
pkgrel=1
pkgdesc="Simple notepad calculator built on Electron, powered by Math.js"
arch=('x86_64')
url="https://numara.io/"
_githuburl="https://github.com/bornova/numara-calculator"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/bornova/numara-calculator/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('9782e0aeaaf9c2d4450d3e52ab434a11825640359ea40b41d0cf12c34022a524'
            'b944c7642b6a0ccf0c24e98d199d8bf4c8d556ebc7d87ddb9af98cab67b378b5'
            'ab3960497ef71983e0d9b815fa1a8e145b2e9d45061c43cdbaa56ef1e962772e')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}