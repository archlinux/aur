# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=wstbld
pkgver=1.1
_rel_at_source=1
pkgrel=0
pkgdesc="web site builder"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname}"
license=('0BSD')
makedepends=('ocompiler')
source=("${pkgname}-${pkgver}-${_rel_at_source}.tar.gz::https://github.com/colin-i/${pkgname}/archive/${pkgname}-${pkgver}-${_rel_at_source}.tar.gz")
sha256sums=('12895f84125d007eca074743b5cb8f426700572c2dd41c6191cbdc366112f2a2')

_tag() {
	cd "${pkgname}-${pkgname}-${pkgver}-${_rel_at_source}"
}

prepare() {
	_patches="`cat ../list`"
	_tag
	for _var in ${_patches[@]}; do
		echo ${_var}
		patch --strip=1 --input=../../${_var}
	done
}

build() {
	_tag
	make
}

package() {
	_tag
	make DESTDIR="$pkgdir/" install
}
