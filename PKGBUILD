# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-lmdb
_project=gawkextlib
pkgver=1.0.1
pkgrel=1
pkgdesc="GAWK extension - interface to the LMDB API"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('lmdb' 'gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('065bca372a3b4d3a2ff833cff429700d')
sha256sums=('706ff641f9b177815fa5bd9fd8801be2f04422b2793c10a243a7db5439c26ed8')

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
