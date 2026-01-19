# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=go-ios-bin
pkgver=1.0.193
pkgrel=1
pkgdesc="A collection of tools to interact with iOS devices on Linux"
arch=('x86_64')
url="https://github.com/danielpaulus/go-ios"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('glibc')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.zip::https://github.com/danielpaulus/go-ios/releases/download/v${pkgver}/go-ios-linux.zip"
        "LICENSE::https://raw.githubusercontent.com/danielpaulus/go-ios/main/LICENSE")
sha256sums=('1d74039ede95e070911065137a9f8569070b3a421eedcc12d7dc0cede6ac9be3'
            'd368be6f632f8f928369c6f1923cf2f884a1ae42a5f0dd218acd96f9bcfa75b4')

latestver() {
    curl -fsSL "https://api.github.com/repos/danielpaulus/go-ios/releases/latest" |
    jq -r '.tag_name // empty' | sed 's/^v//'
}

package() {
    install -Dm755 "${srcdir}/ios-amd64" "${pkgdir}/usr/bin/go-ios"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
