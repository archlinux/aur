# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=encrypt0r-bin
pkgver=3.11.44
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
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/kunalnagar/encrypt0r/v${pkgver}/src/electron/assets/icons/png/512x512.png"
    "${pkgname%-bin}.sh")
sha256sums=('145a0cf61daf9d7488d2702e15a4bf0352fbdf55115a839d671fa9a5e3722036'
            'b669772af42f119f8d89c6a81d69e25bf5debce6534e3259c83dacc230fb8095'
            'cc3b317789119baf211f99836110146fbeff9e3b2995fc72150c32f18cbeba73')
prepare() {
    gendesk -f -n --categories "System;Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/release-builds/${pkgname%-bin}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/release-builds/${pkgname%-bin}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}