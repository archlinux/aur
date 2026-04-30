# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=actionswf
pkgver=1.168
pkgrel=0
pkgdesc="Action Swf library"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname}"
license=('0BSD')
depends=('lib32-glibc' 'bc' 'ffdec-bin' 'python')
makedepends=('lib32-glibc' 'bc' 'ocompiler' 'ffdec-bin' 'python' 'haxe')
source=("${pkgname}-${pkgver}-0.tar.gz::https://github.com/colin-i/${pkgname}/archive/${pkgname}-${pkgver}-0.tar.gz")
sha256sums=('8da868798230d9f870e3605b71924dd3f7084f499d0185f002618d3e96413329')

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
