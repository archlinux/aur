# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=benchworx-bin
pkgver=0.0.1_beta.3
pkgrel=4
pkgdesc="A DynamoDB GUI for local and remote DynamoDB tables"
arch=("x86_64")
url="https://github.com/simonireilly/dynamoDB-benchworx"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron12')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}_amd64.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/.}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('197f8c47e3b937ae6c24be5b7c49a2cd1f38f29205c6e28af987cc3581e8e41e'
            'e1010fd79ad878f26628ed1fa8b8fca082eec9a6314d58cf3525622c9a6eed44')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}