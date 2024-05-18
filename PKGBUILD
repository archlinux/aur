# Maintainer: saying <saying121@outlook.com>
pkgname=lcode-bin
_binname=lcode
_repository=lcode
pkgver=v0.9.1
pkgrel=1
epoch=
pkgdesc="An application of terminal write leetcode."
arch=('x86_64' 'aarch64')
url="https://github.com/saying121/lcode"
license=('Apache-2.0')
depends=('dbus' 'sqlite')
# makedepends=('jq' 'curl')
checkdepends=()
optdepends=('gnome-keyring')
provides=('lcode')
conflicts=()
replaces=()
groups=()
backup=()
options=()
install=
changelog=

source_x86_64=("https://github.com/saying121/${_repository}/releases/download/${pkgver}/${_binname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ed6aab2b66d72ec65a15e1d6d1782d2eab47447d99d17d05cc11a1a5986a0aba')
source_aarch64=("https://github.com/saying121/${_repository}/releases/download/${pkgver}/${_binname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('9d56dcb687ef5beb89702365be419ea8fe45de6b9d7ea9c28506c81e940059fa')

noextract=()
validpgpkeys=()

# pkgver() {
#     curl -s "https://api.github.com/repos/saying121/lcode/releases/latest" | jq '.tag_name'
# }

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
