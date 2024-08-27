# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=kcat
pkgver=1.2.5
pkgrel=1
pkgdesc="Kachina 505DSP - Ham Radio Transceiver Control Program"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com"
license=('GPL-3.0-only')
depends=('fltk' 'flxmlrpc' 'hamradio-menus' 'kcat-docs')
optdepends=('fldigi: for digital mode interface')
makedepends=('automake' 'autoconf' 'pkg-config')
source=("http://www.w1hkj.com/files/kcat/$pkgname-$pkgver.tar.gz"
#	"$pkgname::git://git.code.sf.net/p/fldigi/$pkgname#branch=pu/df"
#	"$pkgname::git://git.code.sf.net/p/fldigi/$pkgname#branch=master")
#	"http://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz")
	diff.kcat.panel.cxx
	)

#pkgver() {
#	cd $srcdir/$pkgname
#
#	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

prepare() {
#	cd $srcdir/$pkgname/src/UI
#	cd $srcdir/$pkgname-$pkgver
	cd $srcdir/$pkgname-$pkgver/src/UI

	patch -p0 < ../../../diff.kcat.panel.cxx
}

build() {
#	cd $srcdir/$pkgname
	cd $srcdir/$pkgname-$pkgver

	autoreconf --install
	automake --add-missing
	./configure --prefix=/usr
	make
}

package() {
#	cd $srcdir/$pkgname
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
md5sums=('f065ea188ca436011949f75c2a2d8b54'
         '2ed1248585a03fc69e6925befef3f64b')
sha256sums=('abc83128d4fc92ee95f930ca721f1386b7b7592b9554fc2b9f14de8887beac84'
            '4ef7df2659f2d23b0d9a83a189e9c57bd4494e3a3486c9615fb1cfcaa813630e')
