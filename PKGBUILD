# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=encrypt0r-bin
pkgver=3.11.22
pkgrel=1
pkgdesc="App to encrypt and decrypt your files with a passphrase, powered by electron"
arch=('x86_64')
url="https://www.kunalnagar.in/blog/encryptor-encrypt-decrypt-files-passphrase/"
_githuburl="https://github.com/kunalnagar/encrypt0r"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=('glib2' 'nspr' 'libxdamage' 'gtk3' 'libcups' 'cairo' 'alsa-lib' 'libxrandr' 'dbus' 'gcc-libs' 'nss' 'pango' 'libdrm' \
    'at-spi2-core' 'expat' 'libxfixes' 'libxcomposite' 'libxkbcommon' 'libx11' 'glibc' 'libxcb' 'libxext' 'mesa')
makedepends=('gendesk')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/kunalnagar/encrypt0r/master/src/electron/assets/icons/png/512x512.png")
sha256sums=('62d46dff7fa853ce818475c5dc031130035eb5bff3218b039726b9930187ac72'
            'b669772af42f119f8d89c6a81d69e25bf5debce6534e3259c83dacc230fb8095')
   
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/release-builds/${pkgname%-bin}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "System;Utility" --name "encrypt0r" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}