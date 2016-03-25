# Maintainer: Freonmonkey <freonmonkey at gmail dot com>
#
# This project provides a stub libhal that uses UDisks and meets the needs
# for playing Flash DRM content without a full HAL installation and daemon.

pkgname=hal-flash
pkgver=0.3.3
pkgrel=1
pkgdesc="A libhal stub library forwarding to UDisks2 for flash to play DRM content"
arch=('i686' 'x86_64')
url="https://github.com/cshorler/hal-flash"
license=('GPL2') 
depends=('udisks2' 'dbus')
provides=('hal=0.5.14')
conflicts=('hal')
source=("https://github.com/cshorler/hal-flash/archive/v${pkgver}.tar.gz")
md5sums=('2d4bc27e33134fcd3a35f56dba697c55')

prepare() {
	mv "$srcdir/$pkgname-$pkgver" "$srcdir/$pkgname"

	cd "$srcdir/$pkgname"

	msg2 "Running autoreconf..."
	autoreconf -i
	msg2 "Running configure..."
	./configure --prefix=/usr --enable-static=no

}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	# Install built files into the package
	cd "$srcdir/$pkgname"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	
	# Skip copying COPYING to LICENSE since it's just GPL2
} 

