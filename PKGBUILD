# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kando-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A pie menu for the desktop. It will be highly customizable and will allow you to create your own menus and actions. "
arch=("x86_64")
url="https://ko-fi.com/post/Introducing-Ken-Do-L3L7L0FQ2"
_githuburl="https://github.com/kando-menu/kando"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.md::https://raw.githubusercontent.com/kando-menu/kando/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('cad7928830a5ef11dbabbd3535706ff6d5aefafd33f2c7b57f5dadc8afb4636d'
            'fd6cb731b549de5452efacb0833cda7a328eb5263537d29ca18de9d7938f7bab'
            '91c98f70d6b34d7b0d97e80745beac27275c2250a38ae7c60763896703ae713e')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}