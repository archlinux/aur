# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udpcast
pkgver=20120424
pkgrel=4
pkgdesc="Network multicasting tool"
arch=('i686' 'x86_64')
url="http://udpcast.linux.lu/"
license=('GPL')
source=("http://udpcast.linux.lu/download/${pkgname}-${pkgver}.tar.gz"
	'udpcast_include.patch')
sha256sums=('ce9090ef80b6035a744a9b5ac335e61c99baa92c39ff53277266fbfcb836445a'
            '3b001226922184698bb3eec1dddf6f75cedc2365e8eee335ba824ca8f3897ed1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# fix missing include
	patch -Np1 < ${srcdir}/udpcast_include.patch

	# install to /usr/bin
	sed -i 's/sbin/bin/g' Makefile.in

	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
}

