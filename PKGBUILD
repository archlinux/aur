# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mendrik-private
_gitname=sqv
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A keyboard-first terminal viewer for SQLite databases"

pkgver=0.1.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"EXAMPLE-${pkgver}.db::${_ghurlraw}/examples/chinook.db")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('9403dfdd7c1cf173044320ac42ba4d6da6d10ca708cf1498496cb525f8ab32b4'
            'a4ed0a2d4b7034ab6ccd66fe1dcbe61ada337d2bcf6c9cfc419449b1e5143ca4')
sha256sums_x86_64=('4f70ff498fc421fa12f2d560f7699ff4e839f5f07b58d09905aff6e6c271eb85')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "EXAMPLE-${pkgver}.db" "${pkgdir}/usr/share/doc/${pkgname}/examples/chinook.db"
}
