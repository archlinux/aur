# Maintainer: Lorenzo Lomartire <lorenzolomartire@googlegroups.com>

_gitauthor=SoCkEt7
_gitname=Livediff
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="👁️ Real-time file monitoring with beautiful, pulsing TUI diff visualization"

pkgver=3.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"CONTEXT-${pkgver}.md::${_ghurlraw}/CONTEXT.md"
		"CHANGELOG-${pkgver}.md::${_ghurlraw}/CHANGELOG.md"
		"USE-CASES-${pkgver}.md::${_ghurlraw}/docs/use-cases.md"
		"LICENSE-MIT-${pkgver}::${_ghurlraw}/LICENSE-MIT"
		"LICENSE-APACHE-${pkgver}::${_ghurlraw}/LICENSE-APACHE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('1f5a28ec17e0c5778bf644dc0bc1993f109464adfb8f4454014b396762cebc16'
            '97cf9c1a29da7db1a68b0ad12c7e2ea7eba30e89613a74c2c34b58803d6a9453'
            '1143e008e8f8e7add0ecdc371830a53a4a7b7dd8156b8258d87eb8dafd994edc'
            'a897f13ed2d110e0dc69f92d382c8fcc7ceac701a55a5fd5b42e11f0390b6a4f'
            'be09529b500a8b5060c4260e2ea822fdfa44131acb116d8e1f4f24cfa9b63a9c'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('e6b9fa7945952c4c16306d16b07825ee5af3a0565c1b78d077506ddd377e91c6')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_gitname,,}-${_gitversion}-${_CARCH}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CONTEXT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTEXT.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "USE-CASES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USE-CASES.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
