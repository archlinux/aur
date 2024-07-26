# Maintainer: saying <saying121@outlook.com>
pkgname=lcode-bin
_binname=lcode
_repository=lcode
pkgver=v0.9.3
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
sha256sums_x86_64=('6312a88a1c595810c6b20aa4d24235b5b931930ff258169410874225102b9b0b')
source_aarch64=("https://github.com/saying121/${_repository}/releases/download/${pkgver}/${_binname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('1817c9ca5d65f9c3e3e006172855d360ca97fab1cf7a88597d5b916b6b4073ed')

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
