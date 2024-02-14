# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=monkey
pkgver=1.7.3
pkgrel=1
pkgdesc='Lightweight and powerful web server'
url='https://github.com/monkey/monkey'
arch=('i686' 'x86_64')
license=('Apache')
depends=('mbedtls')
makedepends=('cmake')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('3ffb76235aec734188fbc41f97ef661cf05cf9ab')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	./configure \
		--malloc-libc \
		--mbedtls-shared \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--libdir=/usr/lib \
		--includedir=/usr/include \
		--sysconfdir=/etc/monkey \
		--webroot=/srv/http \
		--default-port=80 \
		--default-user=http \

	make CMAKE_COMMAND="/usr/bin/cmake" RM="/usr/bin/cmake" CMAKE_SOURCE_DIR="." CMAKE_BINARY_DIR="." DESTDIR="${pkgdir}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make CMAKE_COMMAND="/usr/bin/cmake" RM="/usr/bin/cmake" CMAKE_SOURCE_DIR="." CMAKE_BINARY_DIR="." DESTDIR="${pkgdir}" install
	rm -fr "${pkgdir}"/srv/http
}
