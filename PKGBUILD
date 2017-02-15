# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=xlog
pkgver=2.0.14
pkgrel=2
pkgdesc="Ham Radio general purpose logging program."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/xlog/"
license=('GPL3')
depends=('gtk2>=2.12.0' 'hamlib')
optdepends=(	'cwdaemon: as external keyer'
		'glabels: print log'
		'hamradio-menus: XDG compliant menuing')
makedepends=('pkg-config>=0.9.0' 'libgnomeprint')
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)

prepare() {
	cd $srcdir/$pkgname-$pkgver
	sed -i -e "s:icons:pixmaps:" data/pixmaps/Makefile.in
}

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr LDFLAGS=-lm
	make

	sed -i -e \
	s:"Categories=Utility;Database;HamRadio;GTK":"Categories=Network;HamRadio;": \
	$srcdir/$pkgname-$pkgver/data/desktop/$pkgname.desktop
	sed -i -e s:'ApplicationHamRadio':'Application': \
	$srcdir/$pkgname-$pkgver/data/desktop/$pkgname.desktop
	sed -i -e s:'xlog-icon.png':'xlog-icon': $srcdir/$pkgname-$pkgver/data/desktop/$pkgname.desktop
	sed -i -e s:'text/x-xlog':'text/x-xlog;': $srcdir/$pkgname-$pkgver/data/desktop/$pkgname.desktop
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install

	rm $pkgdir/usr/share/applications/mimeinfo.cache
	rm $pkgdir/usr/share/pixmaps/gnome-mime-text-x-xlog.png
}
md5sums=('20284beeba3cee97e14d651121e1b900')
sha256sums=('16407e016f9991cfe02d85e9841ced6112416e43800898be888a2cc44c368d58')
