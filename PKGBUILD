# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vis
pkgver=0.1
pkgrel=1
pkgdesc='suckless vim like editor'
arch=('i686' 'x86_64')
url='http://repo.or.cz/vis.git'
depends=('ncurses' 'libtermkey' 'lua')
optdepends=('lua-lpeg: for syntax highlighting')
makedepends=('git' 'markdown')
license=('custom:ISC')
source=("git://repo.or.cz/vis.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd vis/

	sed -i '/^\(C\|LD\)FLAGS_LUA =/s/lua5.1/lua/' config.mk
}

build() {
	cd vis/

	make

	markdown README.md > README.html
}

package() {
	cd vis/

	make DESTDIR="${pkgdir}" PREFIX='/usr/' install

	install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/vis/LICENSE"
	install -D -m0644 'README.md' "${pkgdir}/usr/share/doc/vis/README.md"
	install -D -m0644 'README.html' "${pkgdir}/usr/share/doc/vis/README.html"
}

