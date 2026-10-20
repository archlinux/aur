# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=edor
pkgver=1.98
pkgrel=0
pkgdesc="CUI text editor"
arch=('any')
url="https://github.com/colin-i/edor"
license=('0BSD')
depends=('ncurses')
makedepends=('bc')
source=("${pkgname}-${pkgver}-0.tar.gz::https://github.com/colin-i/edor/archive/${pkgname}-${pkgver}-0.tar.gz")
sha256sums=('aff105b4798fe3c076e5ae432b481edebc86056adc1ec7c65108dd4389913db8')

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
