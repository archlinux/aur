# Maintainer: Jozef Riha <jose1711 gmail com>

pkgname=netemul
pkgver=1.0
pkgrel=2
pkgdesc="a program for simulating computer networks"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/netemul"
license=('GPL')
depends=('qt4')
source=("http://sourceforge.net/projects/${pkgname}/files/release-${pkgver}/${pkgname}-${pkgver}.tar.gz" "fix_gcc4.5.patch" "netemul.desktop_fix.patch")
md5sums=('551c5047cb496d0e29cec692899e6e7c'
         '9ba75d825bef9a46fbeecdc209862805'
         'fe642185e030dd731d42a09a03d3676f')

build() {
	export QT_SELECT=4
	cd ${srcdir}/${pkgname}-${pkgver}
	patch -p1 < $srcdir/fix_gcc4.5.patch
	patch -p1 < $srcdir/netemul.desktop_fix.patch
	/usr/bin/qmake-qt4 PREFIX=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make INSTALL_ROOT=$pkgdir install
	/bin/sed -i '/Exec\|Icon/s/local\///g' $pkgdir/usr/share/applications/netemul.desktop
	install -D -m644 $srcdir/${pkgname}-${pkgver}/images/NetEmul_32x32.png $pkgdir/usr/share/netemul/pixmap/NetEmul.png
}
