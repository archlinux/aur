# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=edor
pkgver=1.99
pkgrel=0
pkgdesc="CUI text editor"
arch=('any')
url="https://github.com/colin-i/edor"
license=('0BSD')
depends=('ncurses')
makedepends=('bc')
source=("${pkgname}-${pkgver}-0.tar.gz::https://github.com/colin-i/edor/archive/${pkgname}-${pkgver}-0.tar.gz")
sha256sums=('aca60caa88be549fab4e56c390d94c61e959c260f1469eab18fb344fe62c87db')

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
