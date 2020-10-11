# Maintainer: robertfoster

pkgname=eselect-git
pkgver=1.4.16.r1.e757ab1
pkgrel=1
pkgdesc="Gentoo's multi-purpose configuration and management tool"
url="http://www.gentoo.org/proj/en/eselect/"
arch=('i686' 'x86_64')
license=('GPL')
source=("${pkgname%-git}::git://anongit.gentoo.org/proj/eselect.git")
makedepends=('git')

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.bash
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR=$pkgdir install
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	version="$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "${version#eselect.}"
}

md5sums=('SKIP')
