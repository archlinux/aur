# Maintainer: Sandor Nagy <sandor.nagy[at]kdemail[dot]net>
pkgname=rcssserver
pkgver=15.3.0
pkgrel=1
pkgdesc="The RoboCup Soccer Simulator Server"
arch=('x86_64' 'i686')
url="https://sourceforge.net/apps/mediawiki/sserver/index.php?title=Main_Page"
license=('LGPL')
groups=('rcss')
depends=('boost-libs')
makedepends=('boost>=1.32' 'bison' 'gcc5')
optdepends=(
	'rcssmonitor:	RCSS Monitor'
	'librcsc:	basic library to develop the RCSS client and tools')
replaces=('rcssbase')
options=('buildflags' 'makeflags')
source=(http://downloads.sourceforge.net/sourceforge/sserver/$pkgname-$pkgver.tar.gz)
md5sums=('ada5f3ad42780e748b4896f3d9d508fb')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	CXX=g++-5 ./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
