# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=rotkonetworks
_gitname=zish
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast shell interpreter, written in zig, with built-in AI agent and GGUF inference"

pkgver=0.25.2
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
            '985681a244cccf5d2554312fc7163a3b00c7bcbb1571672dfe27e17df9c4829a'
            '1fb9fa70ab9186cceadfedf00366d587479450d9b8eae962c8719112ddad958c')
sha256sums_x86_64=('f5552bd71ce4c8267df4f783d81a9beaee380d306b8bbd81d43e12d62508c4e7')
sha256sums_aarch64=('5a14a79a0a38429c614c625e2bc38fd4d92341ff5adc42892190b78c3c0ff4b5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "MANPAGE-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
