# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=actionswf
pkgver=1.136
pkgrel=1
pkgdesc="Action Swf library"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname}"
license=('0BSD')
depends=('lib32-glibc' 'bc' 'ffdec-bin')
makedepends=('lib32-glibc' 'bc' 'ocompiler>=1.5+226' 'ffdec-bin')
source=("${pkgname}-`echo ${pkgver} | sed 's/\./\-/'`.tar.gz::https://github.com/colin-i/${pkgname}/archive/`echo ${pkgver} | sed 's/\./\-/'`.tar.gz")
sha256sums=('65ae6d99d6491a1542fae07a39b93c43022e8b84ac1e2d0f646ca13daac5ae28')

_ver_atsource_fn() {
	cd "${pkgname}-`echo ${pkgver} | sed 's/\./\-/'`"
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
