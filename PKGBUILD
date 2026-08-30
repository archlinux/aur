# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=rotkonetworks
_gitname=zish
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast shell interpreter, written in zig, with built-in AI agent and GGUF inference"

pkgver=0.18.1
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
            '2a498ceedc732235db87547f2a2c334eeee8440f69e73d2888ca67587cd1366d'
            '1fb9fa70ab9186cceadfedf00366d587479450d9b8eae962c8719112ddad958c')
sha256sums_x86_64=('23f0e482bbae99d4ba7cb1c9267e35bb0b614c5ec340d582a5b235509e78b154')
sha256sums_aarch64=('880731115fd3221a1a5fa10995b8294adcb67e2a99364f96c2699fbfccf5c7e7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "MANPAGE-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
