# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=pg_top
pkgver=3.7.0
pkgrel=3
pkgdesc='top-like app for monitoring PostgreSQL backends (previously known as ptop)'
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
license=('BSD')  # original BSD license
url='http://ptop.projects.postgresql.org/'
depends=('postgresql-libs')
source=('git+git://git.postgresql.org/git/pg_top.git')
sha512sums=('SKIP')

prepare() {
	cd ${srcdir}/${pkgname}
	git checkout v$pkgver
}


build() {
	cd ${srcdir}/${pkgname}
	LDFLAGS="-lncurses $LDFLAGS"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}
	make DESTDIR="${pkgdir}" install
	install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}/"
	install -D -m644 README HISTORY FAQ "${pkgdir}/usr/share/doc/${pkgname}/"
}
