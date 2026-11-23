# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ABDsheikho
_gitname=histclean
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A cli tool to clean command shell history files"

pkgver=0.4.1
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
sha256sums=('2075c19e5f3978b83c61429e4a1eb707e109d0dbbde98b75166e79d3bce78205'
            'a46fc3252002c7f172a6ed91a79957e73b90726d03a50ee0121bfc14969fb893'
            'a032657897bbc1aa256dc9fb35781c9198e27fbab31a394c12586c6e53c6f4a6'
            'a72166783c0291de649f9695991d27ed21280c2c825620825f66b5f1c6eadf81'
            'df06e67e87dd5337a166b9449f35d92f254e8d60b536a0224aad920670ee2cc6')
sha256sums_x86_64=('0a2d78ca7f6159908c0c93f7f95da7efb2702a0d183a6551c6767098370bd1f6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "COMPLETIONS-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "COMPLETIONS-${pkgver}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"

	install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
