# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=edor
pkgver=1.79
pkgrel=0
pkgdesc="CUI text editor"
arch=('any')
url="https://github.com/colin-i/edor"
license=('0BSD')
depends=('ncurses')
makedepends=('ncurses' 'bc')
source=("${pkgname}-${pkgver}-0.tar.gz::https://github.com/colin-i/edor/archive/${pkgname}-${pkgver}-0.tar.gz")
sha256sums=('7158570f26079493f1899ddc76bb0bb361e31a7cbfd85456a932149169d0e394')

prepare() {
	_patches="`cat ../list`"
	cd "$pkgname-$pkgname-$pkgver-0"
	for _var in ${_patches[@]}; do
		echo ${_var}
		patch --strip=1 --input=../../${_var}
	done
}

build() {
	cd "$pkgname-$pkgname-$pkgver-0"
	autoreconf -i
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgname-$pkgver-0"
	make test
}

package() {
	cd "$pkgname-$pkgname-$pkgver-0"
	make DESTDIR="$pkgdir/" install
}
