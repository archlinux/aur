# Maintainer: Hidehico Oba <hidehico dot ooba at gmail dot com>

_pkgauthor=hidehic0
_pkgname=acc_utils
pkgname=${_pkgname}-bin
pkgver=0.0.8
pkgrel=2
pkgdesc="A tool with enhanced functionality using files created by atcoder-cli"
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('Unlicense')
arch=('x86_64')
depends=('bash')
# install=acc_utils.install
source=("${url}/releases/download/v${pkgver}-2/${_pkgname}_Linux_x86_64.tar.gz")
sha256sums=('6335ef4120d14036aadc91fccb5a862502c72419ba8b26862bc2f44609c26e6b')

build() {
	cd "${srcdir}/" || exit

	mkdir -p ./completions

	"./${_pkgname}" completion bash >./completions/bash
	"./${_pkgname}" completion zsh >./completions/zsh
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -d "${pkgdir}/usr/share/licenses/${pkgname}/third_party_licenses"
	cp -r third_party_licenses/. ${pkgdir}/usr/share/licenses/${pkgname}/third_party_licenses

	install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "./completions/bash" "${pkgdir}/usr/share/bash-completion/completions/acc_utils"
	install -Dm644 "./completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_acc_utils"
}
