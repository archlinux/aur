# Maintainer: Hidehico Oba <hidehico dot ooba at gmail dot com>

_pkgauthor=hidehic0
_pkgname=acc_utils
pkgname=${_pkgname}-bin
pkgver=0.0.7
pkgrel=0
pkgdesc="A tool with enhanced functionality using files created by atcoder-cli"
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('Unlicense')
arch=('x86_64')
depends=('bash')
# install=acc_utils.install
source=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
sha256sums=('4ba4a00161a1e933113016ac8f909298e3667e036d2933f496b43bb68b480c4a')

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
	install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "./completions/bash" "${pkgdir}/usr/share/bash-completion/completions/acc_utils"
	install -Dm644 "./completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_acc_utils"
}
