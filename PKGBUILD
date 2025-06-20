# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=ghdl
pkgver=5.1.1
pkgrel=1
arch=('x86_64')
pkgdesc='VHDL 2008/93/87 simulator - mcode backend'
url='https://github.com/ghdl/ghdl'
license=('GPL-2.0-only')

depends=(
	'gcc-ada')
optdepends=(
	'python-pyghdl: python bindings and utilities')
checkdepends=(
	'python-pytest'
	'python-pytooling')

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/ghdl/ghdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('00cd58ec8f25e2532465aabc8705f43071f20dc1d13e03fd9dc235523186fca9')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr/

	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	# Install man page
	install -Dm0644 -t "$pkgdir/usr/share/man/man1" doc/ghdl.1
}
