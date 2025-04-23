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
	_ver=`echo ${pkgver} | sed 's/\./\-/'`
	_patches="`cat ../list`"
	cd "$pkgname-$_ver"
	for _var in ${_patches[@]}; do
		echo ${_var}
		patch --strip=1 --input=../../${_var}
	done
}

build() {
	_ver=`echo ${pkgver} | sed 's/\./\-/'`
	cd "$pkgname-$_ver"
	autoreconf -i
	./configure --prefix=/usr
	make
}

check() {
	_ver=`echo ${pkgver} | sed 's/\./\-/'`
	cd "$pkgname-$_ver"
	make test
}

package() {
	_ver=`echo ${pkgver} | sed 's/\./\-/'`
	cd "$pkgname-$_ver"
	make DESTDIR="$pkgdir/" install
}
