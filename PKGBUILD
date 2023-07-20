# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="simple-irc-client-bin"
pkgver=0.1.1
pkgrel=2
pkgdesc="Desktop clients for Simple Irc Client"
arch=('x86_64')
url="https://github.com/Simple-Irc-Client/desktop"
license=('AGPL3')
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('8e6a71e380c73061185c8e0c206999a733df3b4be4a4c8c01a9e444c050eb6fc'
            '6d0ab680e8fe80bb5f3b954bb68df76100a4542d2d782a32c245b808ff230b5d')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm755 -d "${pkgdir}/usr"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    sed "s|${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}