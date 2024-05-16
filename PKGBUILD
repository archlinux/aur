# Maintainer: saying <saying121@outlook.com>
pkgname=lcode-bin
_binname=lcode
_repository=lcode
pkgver=v0.9.0
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
sha256sums_x86_64=('8e2b8685d88fba67fbc3a877ee6efb253cdfd17d355874f56403cc81a5589733')
sha256sums_aarch64=('bfe30b35e061bb2d16462b04504b20667197838f0d46096a97e7a1d817e22861')
source_aarch64=("https://github.com/saying121/${_repository}/releases/download/${pkgver}/${_binname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

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
