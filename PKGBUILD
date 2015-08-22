pkgname=libstrophe-git
pkgver=273.cd92f69
pkgrel=1
pkgdesc="A simple, lightweight C library for writing XMPP clients"
arch=('i686' 'x86_64')
url="http://strophe.im/libstrophe/"
license=('MIT' 'GPL3')
depends=('expat')
makedepends=('git' 'doxygen')
checkdepends=('check')
provides=('libstrophe')
conflicts=('libstrophe')
source=('git://github.com/strophe/libstrophe.git')
sha256sums=('SKIP')
options=('staticlibs')

pkgver() {
	cd "$srcdir/libstrophe"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd "$srcdir/libstrophe"

	./bootstrap.sh
	./configure --prefix=/usr
	make
	doxygen
}

check() {
	cd "$srcdir/libstrophe"
	make check
}

package() {
	cd "$srcdir/libstrophe"
	make DESTDIR="${pkgdir}" install
}
