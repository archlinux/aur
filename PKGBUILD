# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=encrypt0r-bin
pkgver=3.11.43
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
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/kunalnagar/encrypt0r/master/src/electron/assets/icons/png/512x512.png"
    "${pkgname%-bin}.sh")
sha256sums=('4445509c9e9995e5c39b7ec5809d1d65c55e390c0f399cc5aa64bc7749324cd6'
            'b669772af42f119f8d89c6a81d69e25bf5debce6534e3259c83dacc230fb8095'
            'cc3b317789119baf211f99836110146fbeff9e3b2995fc72150c32f18cbeba73')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/release-builds/${pkgname%-bin}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/release-builds/${pkgname%-bin}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "System;Utility" --name "encrypt0r" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}