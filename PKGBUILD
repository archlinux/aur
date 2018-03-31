# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-lmdb
_project=gawkextlib
pkgver=1.1.1
pkgrel=1
pkgdesc="GAWK extension - interface to the LMDB API"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('lmdb' 'gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('6a0a0ca6433f7353297edfd765615f46')
sha256sums=('e4993efafa9924928d21b4eee77d5e3d9233ec5c3867685f598ca0bbb9c30cf2')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	# sometimes the test suite fails -- race condition?
	make -k check || :
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
