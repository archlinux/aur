# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aeon-bin
pkgver=0.2.22
pkgrel=5
pkgdesc="Scan the internet for your personal information and modify or remove it"
arch=("x86_64")
url="https://aeon.technology/"
_githuburl="https://github.com/leinelissen/aeon"
license=('EUPL')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('3a3c1112a6a750d503f08ccb2a7481dead7e4e58fc057d99f04f364dcf3c916a'
            'a900231e0771787718ed468b90a623371f7ef8735e04c83c5efd263651378fe4')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/${pkgname}.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}