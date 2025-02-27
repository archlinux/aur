# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udpcast
pkgver=20250223
pkgrel=1
pkgdesc='Network multicasting tool'
arch=('i686' 'x86_64')
url='https://udpcast.linux.lu/'
license=('GPL')
source=("https://udpcast.linux.lu/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cefd7554c877e1bc76987d2b96b23f7699a2e5340c254454f61b6e0dae370aa7')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# sbindir is ignored - install to /usr/bin
	sed -i 's/sbin/bin/g' Makefile.in
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure \
		--prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
}

