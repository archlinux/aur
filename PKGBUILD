# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=libstrophe-git
pkgver=719.06afe3d
pkgrel=1
pkgdesc='A simple, lightweight C library for writing XMPP clients'
arch=('x86_64')
url='http://strophe.im/libstrophe/'
license=('MIT' 'GPL3')
depends=('expat' 'openssl')
makedepends=('git' 'doxygen')
checkdepends=('check')
provides=('libstrophe')
conflicts=('libstrophe')
options=('staticlibs')
source=('git+https://github.com/strophe/libstrophe.git')
b2sums=('SKIP')

pkgver() {
	cd libstrophe
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd libstrophe

	./bootstrap.sh
	./configure --prefix=/usr
	make
	doxygen
}

check() {
	cd libstrophe
	make check
}

package() {
	cd libstrophe
	make DESTDIR="${pkgdir}" install

	install -Dm644 -t "${pkgdir}"/usr/share/licenses/libstrophe-git/ MIT-LICENSE.txt
}
