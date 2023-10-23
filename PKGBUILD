# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=encrypt0r-bin
pkgver=3.11.50
pkgrel=1
pkgdesc="App to encrypt and decrypt your files with a passphrase, powered by electron"
arch=('x86_64')
url="https://www.kunalnagar.in/blog/encryptor-encrypt-decrypt-files-passphrase/"
_githuburl="https://github.com/kunalnagar/encrypt0r"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron18')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-deb.zip"
    "LICENSE.md::https://raw.githubusercontent.com/kunalnagar/encrypt0r/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('d2f9b86e71e5cc7b83a74bc15c7a2d385887a70b4c93b5e1b3ac67db69dfabfa'
            'dd8cfe4d2d540a3c670cf0aa6c95e9076e8949d7c50d04495feb0a6ce9d82cc3'
            '9d56e0adf25490437bd52167d172f543d3a35f33fb4436f242664a1ece0dbbfb')
build() {
    bsdtar -xf "${srcdir}/release-builds/${pkgname%-bin}_0.0.0_amd64.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/swiftshader/"* -t "${pkgdir}/opt/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}