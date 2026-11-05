# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Bengerthelorf
_pkgname=bcmr
pkgname=${_pkgname}-bin
pkgdesc="Better Copy Move Remove — A modern, safe CLI tool for file operations with progress display, resume, and remote copy."

pkgver=0.7.2
pkgrel=2
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[0]}-linux.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'cd3f3d113657e08844fc856caeea7a3d0c3fb765f6c18d5690dd0149aabbd81b')
sha256sums_x86_64=('a0900a597a9f5daa58c339ead94e0058224d3e86cd816c5091fc0e1f0e2f9a53')


build() {
	cd "${srcdir}/" || exit

	mkdir -p "./completions"

	"./${_pkgname}" completions zsh > "./completions/${_pkgname}.zsh"
	"./${_pkgname}" completions bash > "./completions/${_pkgname}.bash"
	"./${_pkgname}" completions fish > "./completions/${_pkgname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "completions/${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 "completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 "completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
