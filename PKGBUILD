# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=edor
pkgver=1.x71
pkgrel=4
pkgdesc="CUI text editor"
arch=('any')
url="https://github.com/colin-i/edor"
license=('0BSD')
depends=('ncurses')
makedepends=('ncurses' 'bc')
source=("${pkgname}-`echo ${pkgver} | sed 's/\./\-/'`.tar.gz::https://github.com/colin-i/edor/archive/`echo ${pkgver} | sed 's/\./\-/'`.tar.gz")
sha256sums=('9ec7b5de238bd84e571f5c7326993b6e76a96c145b26543dd805105a681c9c91')

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
