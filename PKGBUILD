# Maintainer: Jean-Luc Juganniere <jljug@hotmail.com>
pkgname=xpuz
_pkgname=xpuz
pkgver=2.7.1
pkgrel=2
pkgdesc="A fork of xjig 2.5, the jigsaw puzzle."
arch=('x86_64')
url="https://xjigsaw.net/"
license=('GPL3')
makedepends=('git')
depends=('libx11' 'libjpeg-turbo')
source=("$pkgname::git+https://github.com/JeanLucJFr/$_pkgname.git")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	# Statically linking libjpeg doesn't work for some unknown reason.
	sed -i 's/-Wl,-Bstatic//' Makefile
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" MANSECT="6" PROJECTMANSUFFIX="" install install.man
}
