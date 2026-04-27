# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=sirc
_pkgname_atsource=irc-ssl
pkgver=1.20
pkgrel=0
pkgdesc="IRC client with ssl"
arch=('any')
url="https://github.com/colin-i/${_pkgname_atsource}"
license=('0BSD')
depends=('openssl' 'gtk3')
makedepends=('openssl' 'gtk3')
source=("${pkgname}-${pkgver}-0.tar.gz::https://github.com/colin-i/${_pkgname_atsource}/archive/${pkgname}-${pkgver}-0.tar.gz")
sha256sums=('0513f3136f62195b10918e62c181679cf65ee881ab8edd05999e6b18857a557a')

prepare() {
	_patches="`cat ../list`"
	cd "$_pkgname_atsource-$pkgname-$pkgver-0"
	for _var in ${_patches[@]}; do
		echo ${_var}
		patch --strip=1 --input=../../${_var}
	done
}

build() {
	cd "$_pkgname_atsource-$pkgname-$pkgver-0"
	autoreconf -i
	./configure --prefix=/usr
	make
}

check() {
	cd "$_pkgname_atsource-$pkgname-$pkgver-0"
	make test
}

package() {
	cd "$_pkgname_atsource-$pkgname-$pkgver-0"
	make DESTDIR="$pkgdir/" install
}
