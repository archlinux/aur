# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=time-to-leave-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Log work hours and get notified when it's time to leave the office and start to live."
arch=('x86_64')
url="http://timetoleave.app/"
_ghurl="https://github.com/thamara/time-to-leave"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron11'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('cb545e917262e4263c59baa95a2b995d4aac7370bf623ce2b715d4b5d819f45a'
            '6ab5c079355fcffede56e102afb466f87ad8083daca789d9f3f5599cf414e8d6')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}