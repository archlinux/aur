# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=actionswf
pkgver=1.187
pkgrel=1
_rel_at_source=0
pkgdesc="Action Swf library"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname}"
license=('0BSD')
depends=(bc ffdec-bin python haxe) #weak depends
makedepends=(ocompiler edor)
source=("${pkgname}-${pkgver}-${_rel_at_source}.tar.gz::https://github.com/colin-i/${pkgname}/archive/${pkgname}-${pkgver}-${_rel_at_source}.tar.gz")
sha256sums=('be2c34055b171ff9d33614a24250eef81c86dc07423d2e642214fe585340ea60')

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
