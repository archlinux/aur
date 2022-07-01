# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=guile-dsv
pkgver=0.5.1
pkgrel=1
pkgdesc="Delimiter-separated values (DSV) format parser for GNU Guile."
arch=('x86_64')
url="https://github.com/artyom-poptsov/guile-dsv"
license=('GPL')
depends=('guile' 'guile-lib')
options=('!strip')
source=("https://github.com/artyom-poptsov/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c58fcedf023886f39ef9921ad5f5d53f1917bc1d1c77a0535a3d80ff932c3938')

build() {
	cd "$pkgname-$pkgver"
	local sitedir=$(guile-config info sitedir)
	autoreconf -fi
	./configure \
		--prefix=/usr \
		--with-guilesitedir=$sitedir
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
