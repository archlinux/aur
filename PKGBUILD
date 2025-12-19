# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=go-ios-bin
pkgver=1.0.191
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
sha256sums=('b7b00222ad4420e50b68606a930b72ff3403d83767903b546535372fdae7d4b1'
            'd368be6f632f8f928369c6f1923cf2f884a1ae42a5f0dd218acd96f9bcfa75b4')

latestver() {
    curl -s "https://api.github.com/repos/danielpaulus/go-ios/releases/latest" |
    jq -r '.tag_name' | sed 's/^v//'
}

package() {
    install -Dm755 "${srcdir}/ios-amd64" "${pkgdir}/usr/bin/go-ios"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
