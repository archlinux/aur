# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=kcat
pkgver=1.2.4
pkgrel=1
pkgdesc="Kachina 505DSP - Ham Radio Transceiver Control Program"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com"
license=('GPL')
depends=('fltk' 'flxmlrpc')
optdepends=('hamradio-menus: XDG compliant menuing'
	    'kcat-docs: help files'
	    'fldigi: for digital mode interface')
makedepends=('automake' 'autoconf' 'pkg-config')
source=("$pkgname::git://git.code.sf.net/p/fldigi/$pkgname#branch=pu/df"
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
	cd $srcdir/$pkgname/src/UI
#	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../../../diff.kcat.panel.cxx
}

build() {
	cd $srcdir/$pkgname
#	cd $srcdir/$pkgname-$pkgver

	autoreconf --install
	automake --add-missing
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$pkgname
#	cd $srcdir/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
md5sums=('SKIP'
         '775102f21953289fdbb55a0164c091f1')
sha256sums=('SKIP'
            'ad3a0fdce8a83dfb0be1e67b025e3b4946091784bd3d2c01be78f8f91253c761')
