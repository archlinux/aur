# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=monkey
pkgver=1.6.9
pkgrel=1
pkgdesc='Lightweight and powerful web server'
url='http://monkey-project.com/'
arch=('i686' 'x86_64')
license=('Apache')
depends=('mbedtls')
makedepends=('cmake')
source=("http://monkey-project.com/releases/${pkgver%.*}/monkey-${pkgver}.tar.gz")
sha1sums=('70895f0d82418ad15fd84b15ad845537e26a39ac')

options=('!emptydirs')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
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

}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	rm -fr "${pkgdir}"/srv/http
}
