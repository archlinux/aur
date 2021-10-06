# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=xlog
pkgver=2.0.24
pkgrel=1
pkgdesc="Ham Radio general purpose logging program."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/xlog/"
license=('GPL3')
depends=('gtk2>=2.12.0' 'hamlib')
optdepends=(	'cwdaemon: as external keyer'
		'glabels: print log'
		'hamradio-menus: XDG compliant menuing')
makedepends=('pkg-config' 'libgnomeprint')
source=(http://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)

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
md5sums=('4d18ae8b68e8dffa57f46695eb899f19')
sha256sums=('8d453ac6ddc7f5b63d0804114c5423a6b96c0bbed5c23201ffab1244dcc4f8bc')
