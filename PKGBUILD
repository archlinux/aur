# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=actionswf
pkgver=1.158
pkgrel=1
pkgdesc="Action Swf library"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname}"
license=('0BSD')
depends=('lib32-glibc' 'bc' 'ffdec-bin' 'python')
makedepends=('lib32-glibc' 'bc' 'ocompiler' 'ffdec-bin' 'python')
source=("${pkgname}-${pkgver}-0.tar.gz::https://github.com/colin-i/${pkgname}/archive/${pkgname}-${pkgver}-0.tar.gz")
sha256sums=('95f3ba956cda6d6c0d816e662ed108ce9b891831b0558cb9d67319d4fc1112a5')

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
