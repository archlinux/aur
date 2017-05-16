# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=libmodsecurity-git
pkgver=v2.9.0.806.g6143eb99
pkgrel=1

pkgdesc='ModSecurity v3 library component'
arch=('i686' 'x86_64')
depends=('yajl' 'curl' 'libxml2' 'pcre' 'geoip')
makedepends=('git')
url="https://github.com/SpiderLabs/ModSecurity/tree/v3/master"
license=('APACHE')
source=('git+https://github.com/SpiderLabs/ModSecurity.git#branch=v3/master')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir"/ModSecurity
	git describe --long | sed 's|-|.|g'
}

prepare() {
	cd "$srcdir"/ModSecurity
	git submodule update --init
}

build() {
	cd "$srcdir"/ModSecurity
	./build.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/ModSecurity
	make DESTDIR="$pkgdir" install
}
