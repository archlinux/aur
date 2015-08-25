# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=xyscan
pkgver=4.0.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Tool to extract data points from graphical plots'
url='http://rhig.physics.yale.edu/~ullrich/software/xyscan/'
license=('GPL')
depends=('qt5-multimedia>=5.2.0' 'poppler-qt5')
source=(http://rhig.physics.yale.edu/~ullrich/software/$pkgname/Distributions/4.00/$pkgname-4.00-src.tar.gz
	xyscan.desktop)
md5sums=('57000c8e4192c9185647ffb37fad6eca'
	'2df01c952f8425d05e0d138778ca5be9')
install=xyscan.install

prepare() {
	cd $pkgname
	sed -i 's:/usr/local/share/xyscan/docs:/usr/share/doc/xyscan:' xyscanWindow.cpp
	sed -i 's:/usr/local:/usr:' xyscan.pro
}

build() {
	cd $pkgname
	qmake-qt5
	make
}

package() {
	cd $pkgname
	install --mode=755 -D xyscan $pkgdir/usr/bin/xyscan
	install --mode=755 --directory $pkgdir/usr/share/doc/xyscan
	install --mode=644 --target-directory=$pkgdir/usr/share/doc/xyscan docs/*
	install --mode=644 -D images/xyscanIcon.png $pkgdir/usr/share/pixmaps/xyscan.png
	if test -x /usr/bin/desktop-file-install; then
		/usr/bin/desktop-file-install --dir $pkgdir/usr/share/applications $srcdir/xyscan.desktop
	else
		install --mode=644 -D $srcdir/xyscan.desktop $pkgdir/usr/share/applications/xyscan.desktop
	fi
}
