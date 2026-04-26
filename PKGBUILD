# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mendrik-private
_gitname=sqv
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A keyboard-first terminal viewer for SQLite databases"

pkgver=0.1.1
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
sha256sums=('c49560f266faae72025a7b4e7184161cdbc9c1a77fca4e796aaf4cbc3880c932'
            'b7b25f878952e5ca6534eb8ba2ffe19855144b6761f37aa50ed8470a666cd834')
sha256sums_x86_64=('3237d8f49f485e291e60e84a387bcaaba98d1b2f93fd24932e9de3d8b10387ab')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "EXAMPLE-${pkgver}.db" "${pkgdir}/usr/share/doc/${pkgname}/examples/chinook.db"
}
