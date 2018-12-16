# Maintainer: Sandor Nagy <sandor[dot]nagy[at]kdemail[dot]net>
pkgname=soccerwindow2
pkgver=5.1.1
pkgrel=1
pkgdesc="RoboCup Soccer Simulator"
arch=('x86_64' 'i686')
url="https://osdn.net/projects/rctools/"
license=('CCPL')
groups=('rcss')
depends=('librcsc>=4.0.1' 'qt4>=4.3')
makedepends=('boost>=1.32')
optdepends=(
	'rcssserver:	RCSS Server'
	'rcssmonitor:	RCSS Monitor')
options=('buildflags' 'makeflags')
source=(https://osdn.net/dl/rctools/soccerwindow2-5.1.1.tar.gz
	fix-locale.patch)
md5sums=('aa0a30fcf596157b752c695f74f8a97f'
         '65e4af0782e44b54732d825dda88c866')

prepare() {
        cd "$srcdir/$pkgname-$pkgver"
        patch -p0 -i "$srcdir/fix-locale.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
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
