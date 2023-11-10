# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=benchworx-bin
pkgver=0.0.1_beta.3
pkgrel=5
pkgdesc="A DynamoDB GUI for local and remote DynamoDB tables"
arch=("x86_64")
url="https://github.com/simonireilly/dynamoDB-benchworx"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron12'
)
source=(
    "${pkgname%-bin}-${pkgver}_amd64.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/.}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('197f8c47e3b937ae6c24be5b7c49a2cd1f38f29205c6e28af987cc3581e8e41e'
            'bf707797a51b92cb8e2a8b428e566f7b8b65aa9fb84509fd65878b3f9fb0d87d')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}