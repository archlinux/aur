# Maintainer: Colin Arnott <colin@urandom.co.uk>
pkgname="brlaser-git"
pkgver=v3.r24.gf1e0b2d
pkgrel=1
pkgdesc="CUPS driver for the Brother DCP-7065DN"
arch=('x86_64')
url="https://github.com/pdewacht/brlaser"
license=('GPL2')

depends=('cups')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	./autogen.sh
	./configure --prefix=/usr
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
