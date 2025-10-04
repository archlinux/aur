# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=actionswf
pkgver=1.155
pkgrel=1
pkgdesc="Action Swf library"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname}"
license=('0BSD')
depends=('lib32-glibc' 'bc' 'ffdec-bin' 'python')
makedepends=('lib32-glibc' 'bc' 'ocompiler' 'ffdec-bin' 'python')
source=("${pkgname}-${pkgver}-0.tar.gz::https://github.com/colin-i/${pkgname}/archive/${pkgname}-${pkgver}-0.tar.gz")
sha256sums=('e1eeb2b364a3ddae2381c66a04c62a25fc2f02596be7b89adb46d9777a8b38af')

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
