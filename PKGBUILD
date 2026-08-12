# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=flutterdec-bin
pkgver=0.1.0_alpha.4
pkgrel=1
pkgdesc='Static Flutter AOT decompiler — emits pseudo-Dart from libapp.so (ARM64)'
arch=('x86_64')
url='https://github.com/caverav/flutterdec'
license=('MIT')
provides=('flutterdec')
conflicts=('flutterdec')
options=('!debug')

_tag="v${pkgver//_/-}"
source=("flutterdec-${pkgver}-Linux-X64.tar.gz::https://github.com/caverav/flutterdec/releases/download/${_tag}/flutterdec-${_tag}-Linux-X64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/caverav/flutterdec/${_tag}/LICENSE")
sha256sums=('debfd6fe107603d47880e7201f59bd07077adb3f27d50ceee7e3064116c32007'
            'ecbfc79ff871cb1044de5dadf508288fbfabe92d25670f4a176117c20889150d')

latestver() {
    gh api --paginate repos/caverav/flutterdec/releases --jq \
        '.[] | select(.draft == false) | .tag_name' |
        sed -nE 's/^v([0-9]+\.[0-9]+\.[0-9]+(-[a-zA-Z0-9.]+)?)$/\1/p' |
        sed 's/-/_/g' | sort -V | tail -1
}

package() {
    install -Dm755 flutterdec "${pkgdir}/usr/bin/flutterdec"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
