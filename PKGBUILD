# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=actionswf
pkgver=1.149
pkgrel=0
pkgdesc="Action Swf library"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname}"
license=('0BSD')
depends=('lib32-glibc' 'bc' 'ffdec-bin')
makedepends=('lib32-glibc' 'bc' 'ocompiler' 'ffdec-bin')
source=("${pkgname}-${pkgver}-0.tar.gz::https://github.com/colin-i/${pkgname}/archive/${pkgname}-${pkgver}-0.tar.gz")
sha256sums=('ede6786bb9821681ee1860a472190f98105e77bf38df9ed97b6774962ebbfab4')

_ver_atsource_fn() {
	cd "$pkgname-$pkgname-$pkgver-0"
}

prepare() {
	_patches="`cat ../list`"
	_ver_atsource_fn
	for _var in ${_patches[@]}; do
		echo ${_var}
		patch --strip=1 --input=../../${_var}
	done
	touch include_dev
}

build() {
	_ver_atsource_fn
	make
}

check() {
	_ver_atsource_fn
	make test
}

package() {
	_ver_atsource_fn
	make DESTDIR="$pkgdir/" install
}
