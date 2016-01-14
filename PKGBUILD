# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash
pkgver=2.40
pkgrel=1
pkgdesc="Yet Another SHell is a POSIX-compliant command line shell"
arch=("i686" "x86_64")
license=("GPL2")
url="http://sourceforge.jp/projects/yash/"
#ToDo: Add propper deps
makedepends=("pax")
source=("${pkgname}-${pkgver}.tar.xz::http://osdn.jp/frs/redir.php?m=iij&f=%2Fyash%2F63432%2Fyash-2.38.tar.xz")

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

md5sums=('7cdebec758b8301622d0e33e99305be2')
