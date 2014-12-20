# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=crosstool-ng-linaro
pkgver=2014.09
pkgrel=1
pkgdesc="crosstool-NG aims at building toolchains (Linaro source)"
arch=('any')
url="http://linaro.org"
license=('GPL')
depends=('ncurses' 'make')
makedepends=('flex' 'bison')
provides=('crosstool-ng')
conflicts=('crosstool-ng')

_crosstool_ng_ver="1.13.1"
_gcc_ver="4.9"

source=("http://releases.linaro.org/14.09/components/toolchain/binaries/${pkgname}-${_crosstool_ng_ver}-${_gcc_ver}-${pkgver}.tar.bz2")
md5sums=('8a01fde555f1127885b16b55793cfb65')

build () {
	cd "${pkgname}-${_crosstool_ng_ver}-${_gcc_ver}-${pkgver}"

	./configure --prefix=/usr
	make
}

package () {
	cd "${pkgname}-${_crosstool_ng_ver}-${_gcc_ver}-${pkgver}"

	make DESTDIR="$pkgdir" install
	install -Dm644 ct-ng.comp "$pkgdir/etc/bash_completion.d/ct-ng"
}
