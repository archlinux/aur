# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=encrypt0r-bin
pkgver=3.11.51
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
sha256sums=('736d78d361a60cf17004be6b2845f35c244e6e67679c6c3ed21964bf2954472d'
            'dd8cfe4d2d540a3c670cf0aa6c95e9076e8949d7c50d04495feb0a6ce9d82cc3'
            '3a81f6e672e0e47b8a1ad0acd6766f39663d9718bfea84b710a305ac514178db')
build() {
    bsdtar -xf "${srcdir}/release-builds/${pkgname%-bin}_0.0.0_amd64.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}