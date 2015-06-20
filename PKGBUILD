# Maintainer: Sándor Nagy <sanya868[at]gmail[dot]com>
pkgname=rcssserver
pkgver=15.2.2
pkgrel=1
pkgdesc="The RoboCup Soccer Simulator Server"
arch=('x86_64' 'i686')
url="https://sourceforge.net/apps/mediawiki/sserver/index.php?title=Main_Page"
license=('LGPL')
groups=('rcss')
depends=('boost-libs')
makedepends=('boost>=1.32' 'bison27')
optdepends=(
	'rcssmonitor:	RCSS Monitor'
	'librcss:	basic library to develop the RCSS client and tools')
replaces=('rcssbase')
options=('buildflags' 'makeflags')
source=(http://downloads.sourceforge.net/sourceforge/sserver/$pkgname-$pkgver.tar.gz)
sha512sums=('7deb17a1645fd5ec398d0d709fc626ad9b7546ee2480dc89ec9df4c9f0d5ef2d5a46758305df0f349751555c8d337081c3ba1ebe005a745b9242de6156d89f34')

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
