# Maintainer: Bogdan Szczurek <thebodzio@gmail.com>

pkgname=grokevt
pkgver=0.5.0
pkgrel=1
pkgdesc="Collection of scripts for reading Windows log files"
arch=('any')
url="http://projects.sentinelchicken.org/grokevt"
license=('GPL')
depends=('python>=2.3' 'reglookup')
makedepends=('make')
source=(http://grokevt.googlecode.com/files/$pkgname-$pkgver.tar.gz
	Makefile.doc.patch
	grokevt-distutils.py.patch)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -d doc < ../Makefile.doc.patch
	patch < ../grokevt-distutils.py.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make ETC_PREFIX=/etc || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make MAN_PREFIX="$pkgdir/usr/share/man" ETC_PREFIX="$pkgdir/etc" PREFIX="$pkgdir/usr" install
}

md5sums=('787a28d5d253e07522305208ca65bc96'
	'1f338294554020312b588e6555d977ce'
	'048c85f9ddade2b1ea238896c3d35611')
