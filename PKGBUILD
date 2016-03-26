# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vis
pkgver=0.2
pkgrel=1
pkgdesc='modern, legacy free, simple yet efficient vim-like editor'
arch=('i686' 'x86_64')
url='http://www.brain-dump.org/projects/vis/'
depends=('ncurses' 'libtermkey' 'lua')
makedepends=('markdown')
optdepends=('lua-lpeg: for syntax highlighting')
license=('custom:ISC')
source=("http://www.brain-dump.org/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	'pie.patch')
sha256sums=('3e5b81d760849c56ee378421e9ba0f653c641bf78e7594f71d85357be99a752d'
	'44edf0d92e1e0e5533f9d8cc5a948aaa91c7f2fc5f3617e103c57588b335d093')

prepare() {
	cd "${pkgname}-${pkgver}/"

	patch -Np1 < "${srcdir}/pie.patch"
}

build() {
	cd "${pkgname}-${pkgver}/"

	./configure --prefix=/usr
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

