# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ABDsheikho
_gitname=histclean
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A cli tool to clean command shell history files"

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("COMPLETIONS-${pkgver}.bash::${_ghurlraw}/completions/${_appname}.bash"
		"COMPLETIONS-${pkgver}.zsh::${_ghurlraw}/completions/${_appname}.zsh"
		"MAN-${pkgver}.1::${_ghurlraw}/doc/man/${_appname}.1"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}")
sha256sums=('64607fa747cc6a8a524a2eb491f0a0a1bd21db9346a0592a20725c69e75ad23b'
            'd10e16378ca9aac4ad4a87dad438a633990edf511f8cfc4ac268d04066b4838b'
            'b10829079cfa4d8a83e7c1f784a9c1dfb6cc9275d273e9f53d854f7e4876f84d'
            '0b832ce48674b87ab7a96c23b67d742789ba657be4a6ba93c719061a100cb24d'
            'df06e67e87dd5337a166b9449f35d92f254e8d60b536a0224aad920670ee2cc6')
sha256sums_x86_64=('3ca61256eaf20362a886fa8cfa86cae517a22d61c37241a0b3f3e449bb6b950e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "COMPLETIONS-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "COMPLETIONS-${pkgver}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"

	install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
