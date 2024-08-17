# Maintainer: saying <saying121@outlook.com>
pkgname=lcode-bin
_binname=lcode
_repository=lcode
pkgver=v0.9.5
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
sha256sums_x86_64=('2d758557f4cb271e14325043c7dba6dc921d9e53a9cba026a286778f9f7dfc4a')
source_aarch64=("https://github.com/saying121/${_repository}/releases/download/${pkgver}/${_binname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('46fe89a609e0db205c9bea149ed7dc1467a730e82d0910ae7efca6bd6a8a18f6')

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
