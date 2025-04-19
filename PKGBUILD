# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=edor
pkgver=1.x69
pkgrel=2
pkgdesc="CUI text editor"
arch=('any')
url="https://github.com/colin-i/edor"
license=('0BSD')
depends=('ncurses')
makedepends=('ncurses' 'bc')
source=("${pkgname}-`echo ${pkgver} | sed 's/\./\-/'`.tar.gz::https://github.com/colin-i/edor/archive/`echo ${pkgver} | sed 's/\./\-/'`.tar.gz")
sha256sums=('c27d28fa67d41fe144803dcd9e836d559ef4fb65e287f7cf044f0c421c1b52f3')

prepare() {
	ver=`echo ${pkgver} | sed 's/\./\-/'`
	patches="`cat ../list`"
	cd "$pkgname-$ver"
	for var in ${patches[@]}; do
		echo ${var}
		patch --strip=1 --input=../../${var}
	done
}

build() {
	ver=`echo ${pkgver} | sed 's/\./\-/'`
	cd "$pkgname-$ver"
	autoreconf -i
	./configure --prefix=/usr
	make
}

check() {
	ver=`echo ${pkgver} | sed 's/\./\-/'`
	cd "$pkgname-$ver"
	make test
}

package() {
	ver=`echo ${pkgver} | sed 's/\./\-/'`
	cd "$pkgname-$ver"
	make DESTDIR="$pkgdir/" install
}
