# Maintainer: Colin Arnott <colin@urandom.co.uk>
pkgname="brlaser-git"
pkgver=v3.r35.g3946f2e
pkgrel=1
pkgdesc="CUPS driver for the Brother DCP-7065DN"
arch=('x86_64')
url="https://github.com/pdewacht/brlaser"
license=('GPL2')
depends=('cups')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $pkgname
	cmake .
}

build() {
	cd $pkgname
	make
}

check() {
	cd $pkgname
	make -k check
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir/" install
}
