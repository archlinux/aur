# Contributor: Anton Leontiev <scileont /at/ gmail.com>
pkgname=xyscan
pkgver=4.6.4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Tool to extract data points from graphical plots'
url='http://rhig.physics.yale.edu/~ullrich/software/xyscan/'
license=('GPL')
depends=('qt5-charts' 'qt5-multimedia>=5.2.0' 'poppler-qt5')

# Version in filename lacks last dot
pkgverf=${pkgver%.*}${pkgver##*.}
source=(http://rhig.physics.yale.edu/~ullrich/software/$pkgname/Distributions/$pkgverf/$pkgname-$pkgverf-src.tgz
	xyscan.desktop)
md5sums=('20226ddcba9f8054ac63dd19aa055669'
         '2df01c952f8425d05e0d138778ca5be9')

prepare() {
	cd $pkgname
	sed -i 's:/usr/local/share/xyscan/docs:/usr/share/xyscan/docs:' src/xyscanBaseWindow.cpp
}

build() {
	cd $pkgname
	qmake-qt5 PREFIX=/usr
	make
}

package() {
	cd $pkgname
	make install INSTALL_ROOT="$pkgdir"
	install --mode=644 -D images/xyscanIcon.png $pkgdir/usr/share/pixmaps/xyscan.png
	install --mode=644 -D $srcdir/xyscan.desktop $pkgdir/usr/share/applications/xyscan.desktop
}
