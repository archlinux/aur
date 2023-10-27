# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=3fa-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A secure and scalable multi-factor authentication system including a client application, admin dashboard, and backend server"
arch=('x86_64')
url="https://3fa.netlify.app/"
_githuburl="https://github.com/Computing-Collective/3FA"
license=('AGPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron26')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('c28eb31e5fd5f8f16d212be35b98888f7424005d59f7743b1c074057f9e709b6'
            '00460728a3ce91d29371bbe77ac4f4bf7f108f89bbcee9fd5dbb652f2689c528')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s| %U||g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}