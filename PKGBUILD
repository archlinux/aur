# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jamesob
_pkgname=desk
pkgname=${_pkgname}
pkgver=0.6.0
pkgrel=1
pkgdesc="A lightweight workspace manager for the shell"
arch=('any')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('MIT')

provides=("${pkgname}")
makedepends=('rust' 'gzip' 'help2man')

source=(git+"https://github.com/${_pkgauthor}/${_pkgname}.git#tag=v${pkgver}")
sha256sums=('9865c7f4498a267f534cc415bbdab7ca0d594ec5b0785984123de0eb06a7ed93')


package() {
	cd ${srcdir}/${pkgname} || exit 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "./shell_plugins/bash/${pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 "./shell_plugins/zsh/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 "./shell_plugins/fish/${pkgname}.fish" "${pkgdir}/usr/share/fish/completions/${_pkgname}.fish"
}
