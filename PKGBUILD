# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=sirc
_pkgname_atsource=irc-ssl
pkgver=1.19
pkgrel=0
pkgdesc="IRC client with ssl"
arch=('any')
url="https://github.com/colin-i/${_pkgname_atsource}"
license=('0BSD')
depends=('openssl' 'gtk3')
makedepends=('openssl' 'gtk3')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/colin-i/${_pkgname_atsource}/archive/${pkgname}-${pkgver}-0.tar.gz")
sha256sums=('0998863114791a20387006f0dcf9e68813e0b82d330f0c8b13846b95e4211ffa')

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
