# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udpcast
pkgver=20230319
pkgrel=1
pkgdesc='Network multicasting tool'
arch=('i686' 'x86_64')
url='https://udpcast.linux.lu/'
license=('GPL')
source=("https://udpcast.linux.lu/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d96e6e455fce0a8706bbebdea41d0c7ad910ab5901293ff74d2d8ce27302e662')

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

