# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vis
pkgver=0.1
pkgrel=1
pkgdesc='suckless vim like editor'
arch=('i686' 'x86_64')
url='http://repo.or.cz/vis.git'
depends=('ncurses' 'libtermkey' 'lua')
optdepends=('lua-lpeg: for syntax highlighting')
makedepends=('markdown')
license=('custom:ISC')
source=("http://www.brain-dump.org/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c695b095f85f4360590865b0b7007aa019463b24c1026c0e624a78b31f3ac54b')

prepare() {
	cd "${pkgname}-${pkgver}/"

	sed -i '/^\(C\|LD\)FLAGS_LUA =/s/lua5.1/lua/' config.mk
}

build() {
	cd "${pkgname}-${pkgver}/"

	make

	markdown README.md > README.html
}

package() {
	cd "${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}" PREFIX='/usr/' install

	install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/vis/LICENSE"
	install -D -m0644 'README.md' "${pkgdir}/usr/share/doc/vis/README.md"
	install -D -m0644 'README.html' "${pkgdir}/usr/share/doc/vis/README.html"
}

