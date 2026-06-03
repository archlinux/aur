# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=go-ios-bin
pkgver=1.0.218
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
sha256sums=('a9471a0a72c4ec645d22d3941fcfdedfb967a3c4fad25838a4fe36e9715a6ac9'
            'd368be6f632f8f928369c6f1923cf2f884a1ae42a5f0dd218acd96f9bcfa75b4')

latestver() {
    gh api --paginate repos/danielpaulus/go-ios/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "go-ios-linux.zip")) | .tag_name' |
    head -1 | sed 's/^v//'
}

package() {
    install -Dm755 "${srcdir}/ios-amd64" "${pkgdir}/usr/bin/go-ios"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
