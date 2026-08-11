# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=go-ios-bin
pkgver=1.3.1
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
sha256sums=('51ba1e7d88d5c803592dd9d6d7d6e485fc3f088395a4dd3cde1409838d1dd4e0'
            'd368be6f632f8f928369c6f1923cf2f884a1ae42a5f0dd218acd96f9bcfa75b4')

latestver() {
    gh api --paginate repos/danielpaulus/go-ios/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "go-ios-linux.zip")) | .tag_name' |
    head -1 | sed 's/^v//'
}

package() {
    install -Dm755 "${srcdir}/ios-amd64" "${pkgdir}/usr/bin/go-ios"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
