# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=somafm-desktop-player-bin
pkgver=0.0.24
pkgrel=2
pkgdesc="SomaFM desktop player built with Electron and React"
arch=("x86_64")
url="https://alechko.github.io/somafm-desktop-player/"
_githuburl="https://github.com/alechko/somafm-desktop-player"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron16')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/alechko/somafm-desktop-player/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('e5790fbe31508202725c3580466baad18cd90ac9c032f8c73ae63e10024fa8f7'
            '5e404eae8a20b20c3e2ab7e0a08d04012d2cf8d5bf266849a22d7aa810409381'
            '1310bd669812eb2debd5ee9923b528aa87f1ef54f1f4b45bec60da01f520e18b')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/app.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/assets/icon.png" -t "${pkgdir}/opt/${pkgname%-bin}/resources/assets"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/swiftshader/"* -t "${pkgdir}/opt/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/assets/icon.png"  "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}