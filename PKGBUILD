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
    "LICENSE::https://raw.githubusercontent.com/kando-menu/kando/main/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('cad7928830a5ef11dbabbd3535706ff6d5aefafd33f2c7b57f5dadc8afb4636d'
            'fd6cb731b549de5452efacb0833cda7a328eb5263537d29ca18de9d7938f7bab'
            '93835eb08477b3de24b60419e937f6b660723bc73bf1425344040c2c586420b5')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}