# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=edor
pkgver=1.72
pkgrel=0
pkgdesc="CUI text editor"
arch=('any')
url="https://github.com/colin-i/edor"
license=('0BSD')
depends=('ncurses')
makedepends=('ncurses' 'bc')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/colin-i/edor/archive/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
sha256sums=('95666536cc5f0b84255246c6fbd960473e8e51707c5bde091987d9528cb6e8e6')

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
