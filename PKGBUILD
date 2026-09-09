# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=rotkonetworks
_gitname=zish
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast shell interpreter, written in zig, with built-in AI agent and GGUF inference"

pkgver=0.22.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux' 'aarch64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("MANPAGE-${pkgver}.1::${_ghurlraw}/${_appname}.1"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('5a4c025947240e5f8a6d5bea2990741d4b137b2dba98e4ead828137128fd0cec'
            'a27fe7ebd70b5c15dd25a2fbe0037a22636f6596c7f40cd9204657bcbd57aee8'
            '1fb9fa70ab9186cceadfedf00366d587479450d9b8eae962c8719112ddad958c')
sha256sums_x86_64=('2730e7006c9b9490b095b7e3540dfabbf37f67544fc03309fb6ba6c23920e809')
sha256sums_aarch64=('9a72515bf1d3afb1385d8a507eca95f06239e6805e9a4c31ff42ff8bdc8efc3e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "MANPAGE-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
