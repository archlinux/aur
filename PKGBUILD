# Maintainer: saying <saying121@outlook.com>
pkgname=lcode-bin
_binname=lcode
_repository=lcode
pkgver=v0.9.8
pkgrel=1
pkgdesc="An application of terminal write leetcode."
arch=('x86_64' 'aarch64')
url="https://github.com/saying121/lcode"
license=('Apache-2.0')
depends=('dbus' 'sqlite' 'mdcat')
checkdepends=()
optdepends=('gnome-keyring')
provides=('lcode')
conflicts=()

source_x86_64=("https://github.com/saying121/${_repository}/releases/download/${pkgver}/${_binname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1868021d807ebf698fca2bcfd5062b20e985c25ab8f8a097b56c4b70a5e79970')
source_aarch64=("https://github.com/saying121/${_repository}/releases/download/${pkgver}/${_binname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('1946948a757ab4e2c496d7f1412a77fbd47f17b92426abf48924fac8d30a760b')

build() {
    install -dm755 "completions"
    ./lcode --generate=zsh >completions/_${_binname}
    ./lcode --generate=bash >completions/${_binname}.bash
    ./lcode --generate=fish >completions/${_binname}.fish
}

package() {
    install -Dm755 "./${_binname}" "${pkgdir}/usr/bin/${_binname}"

    install -Dm644 completions/_${_binname} "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
    install -Dm644 completions/${_binname}.bash "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
    install -Dm644 completions/${_binname}.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
}
