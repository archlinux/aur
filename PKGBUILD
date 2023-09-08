# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yana-bin
_pkgname=Yana
pkgver=1.0.16
pkgrel=3
pkgdesc="Powerful note-taking app with nested documents, full-text search, rich-text editor, code snippet editor and more"
arch=("x86_64")
url="https://yana.js.org/"
_githuburl="https://github.com/lukasbach/yana"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron10' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}_amd64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/lukasbach/yana/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('00d2f30dad0342fa59fa228f087bf647cf2fa6fe061aa46ede22a5439d5c23b8'
            'd51fa4278a4f3a6871df2e45a74a3a242f253b21e1ed655f7117d5dd45570a32'
            '546e75b9012146cc72160fcd777d69ba3dd220bdd2c7178005c67f9d55617d3c')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Yana/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}