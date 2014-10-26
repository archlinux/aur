# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=xyscan
pkgver=3.3.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Tool to extract data points from graphical plots'
url='http://star.physics.yale.edu/~ullrich/xyscanDistributionPage/'
license=('GPL')
depends=('qt5-base>=5.2.0')
source=(http://star.physics.yale.edu/~ullrich/xyscanDistributionPage/3.33/$pkgname-3.33-src.tar.gz
	xyscan-$pkgver-docs.patch
	xyscan.desktop)
md5sums=('d236ee95950edbf0dfef895ea59aafcd'
	'22093f1c22b73f95de1cbfee14d74dc4'
	'2df01c952f8425d05e0d138778ca5be9')
install=xyscan.install

build() {
	cd $pkgname
	patch -i ../$pkgname-$pkgver-docs.patch
	qmake-qt5
	make
}

package() {
	cd $pkgname
	install --mode=755 -D xyscan $pkgdir/usr/bin/xyscan
	install --mode=755 --directory $pkgdir/usr/share/doc/xyscan/{en,fr}
	install --mode=644 --target-directory=$pkgdir/usr/share/doc/xyscan/en docs/en/*
	install --mode=644 --target-directory=$pkgdir/usr/share/doc/xyscan/fr docs/fr/*
	install --mode=644 -D images/xyscanIcon.png $pkgdir/usr/share/icons/hicolor/32x32/apps/xyscan.png
	if test -x /usr/bin/desktop-file-install; then
		/usr/bin/desktop-file-install --dir $pkgdir/usr/share/applications $srcdir/xyscan.desktop
	else
		install --mode=644 -D $srcdir/xyscan.desktop $pkgdir/usr/share/applications/xyscan.desktop
	fi
}
