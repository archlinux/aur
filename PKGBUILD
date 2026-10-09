# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=actionswf
pkgver=1.183
pkgrel=1
_rel_at_source=1
pkgdesc="Action Swf library"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname}"
license=('0BSD')
depends=('bc' 'python' 'haxe') #weak depends #bc only for oaalternative.sh
optdepends=(
    'ffdec-bin: oaalternative.sh'
) # aur weak depends
makedepends=('ocompiler' 'bc' 'ffdec-bin' 'python' 'haxe')
source=("${pkgname}-${pkgver}-${_rel_at_source}.tar.gz::https://github.com/colin-i/${pkgname}/archive/${pkgname}-${pkgver}-${_rel_at_source}.tar.gz")
sha256sums=('506cdc324b69f398c05e6ed5733fac37980c5212f93bc20cb8cd6333d683cdc4')

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
