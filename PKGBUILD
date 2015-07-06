# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=xlog
pkgver=2.0.12
pkgrel=2
pkgdesc="Ham Radio general purpose logging program."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/xlog/"
license=('GPL3')
depends=('gtk2>=2.12.0' 'hamlib' 'desktop-file-utils')
makedepends=('pkg-config>=0.9.0' 'libgnomeprint')
optdepends=('cwdaemon: as external keyer' 'glabels: print log')
install=xlog.install
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz
	$pkgname.install)

build() {
	cd $srcdir/$pkgname-$pkgver

	sed -i -e "s:icons:pixmaps:" data/pixmaps/Makefile.in

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

md5sums=('58707ed6ed8ea96e57a8b46c4a009f21'
         '59746acafa70800d71269e0165ab4016')
sha256sums=('c5666c53e67b92b49bedb5ee1a629cf62d384033af6a912dff7726995775abd4'
            'd2a07645e26a33cdf406bf273bc9d5697043555ac236cdb6349e66e679845ebd')
