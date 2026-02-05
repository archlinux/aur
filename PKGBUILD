# Maintainer: George Tsiamasiotis <george@tsiamasiotis.gr>

pkgname=ghdl
pkgver=5.1.1
pkgrel=2
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

source=( # Upstream likes moving this tag - I'm really tempted to just pin a commit.
	"$pkgname-$pkgver.tar.gz::https://github.com/ghdl/ghdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e065bbf0d3c76f9b8d1d852be87c0c1d47976d56c19ab0d72a606c71d640c5da')

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
