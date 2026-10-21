# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=actionswf
pkgver=1.185
pkgrel=0
_rel_at_source=0
pkgdesc="Action Swf library"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname}"
license=('0BSD')
depends=(bc ffdec-bin python haxe) #weak depends
makedepends=(ocompiler)
source=("${pkgname}-${pkgver}-${_rel_at_source}.tar.gz::https://github.com/colin-i/${pkgname}/archive/${pkgname}-${pkgver}-${_rel_at_source}.tar.gz")
sha256sums=('276c1aa2f4223841bcd6201725d4ea44c40cb84e940f6e32e41bc5326df39f9f')

_ver_atsource_fn() {
	cd "$pkgname-$pkgname-$pkgver-${_rel_at_source}"
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
