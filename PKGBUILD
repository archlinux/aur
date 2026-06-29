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
sha256sums=('eea0da4644b4f221ac5d71c644ce973b142194d2b3ec510b62da560ed1d73926'
            'ab6a71d5c4e0e540de60cae7113e512ac02eba87f2fbae906578da5e9aeaf0c3'
            'b10829079cfa4d8a83e7c1f784a9c1dfb6cc9275d273e9f53d854f7e4876f84d'
            'ea516eb3487e7dd1b3fd3cd232fd4070a3954a5aec540655a3c56e1a99883cf1'
            'df06e67e87dd5337a166b9449f35d92f254e8d60b536a0224aad920670ee2cc6')
sha256sums_x86_64=('2a3ba9be8dd97e1cf6b39d3587c2de0a33e0d1b6a39411ab649843dbc5d00e2c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "COMPLETIONS-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "COMPLETIONS-${pkgver}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"

	install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
