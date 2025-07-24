# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=wstbld
pkgver=1.3
_rel_at_source=0
pkgrel=0
pkgdesc="web site builder"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname}"
license=('0BSD')
makedepends=('ocompiler')
source=("${pkgname}-${pkgver}-${_rel_at_source}.tar.gz::https://github.com/colin-i/${pkgname}/archive/${pkgname}-${pkgver}-${_rel_at_source}.tar.gz")
sha256sums=('e9b13dc42b0a2c9799effabd139b47c139baa9023e1f19070398a96954d4ce84')

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
