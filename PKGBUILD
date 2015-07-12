# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash
pkgver=2.37
pkgrel=2
pkgdesc="Yet Another SHell is a POSIX-compliant command line shell"
arch=("i686" "x86_64")
license=("GPL2")
url="http://sourceforge.jp/projects/yash/"
#ToDo: Add propper deps
makedepends=("pax")
source=("${pkgname}-${pkgver}.tar.xz::http://iij.dl.sourceforge.jp/yash/62651/${pkgname}-${pkgver}.tar.xz")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	export LDFLAGS="${LDFLAGS} -lXau -lm"

	./configure --prefix=/usr \
		libdir=/usr/lib \
		libexecdir=/usr/lib/yash \
		bindir=/usr/bin \
		sbindir=/usr/bin \
		--enable-alias \
		--enable-array \
		--enable-dirstack \
		--enable-help \
		--enable-history \
		--enable-lineedit \
		--enable-nls \
		--enable-printf \
		--enable-socket \
		--disable-test \
		--enable-ulimit
 	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	LDFLAGS="${LDFLAGS} -lXau -lm"

	make install DESTDIR=$pkgdir \
		prefix=/usr \
		libdir=/usr/lib \
		libexecdir=/usr/lib/yash \
		bindir=/usr/bin \
		sbindir=/usr/bin
}

#Default to md5 as makepkg do, blame Allan McRae
md5sums=('c119e542d58d5555d36f237c0011e83d')
