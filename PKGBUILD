# Contributor: Jozef Riha <jose1711 gmail com>

pkgname=netemul
pkgver=1.0
pkgrel=1
pkgdesc="a program for simulating computer networks"
arch=('i686')
url="http://sourceforge.net/projects/netemul"
license=('GPL')
depends=('qt')
source=("http://sourceforge.net/projects/${pkgname}/files/release-${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('551c5047cb496d0e29cec692899e6e7c')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	qmake PREFIX=/usr || return 1
	make || return 1
	make INSTALL_ROOT=$pkgdir install || return 1
	/bin/sed -i '/Exec\|Icon/s/local\///g' $pkgdir/usr/share/applications/netemul.desktop || return 1
	install -D -m644 $srcdir/${pkgname}-${pkgver}/images/NetEmul_32x32.png $pkgdir/usr/share/netemul/pixmap/NetEmul.png || return 1
}
