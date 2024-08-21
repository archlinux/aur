# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mawk
pkgver=1.3.4_20240819
pkgrel=1

pkgdesc="An interpreter for the AWK Programming Language"
arch=('i686' 'x86_64')
url="http://invisible-island.net/mawk/"
license=('GPL')

depends=('glibc')
changelog="changelog.txt"

source=("https://invisible-island.net/archives/$pkgname/$pkgname-${pkgver//_/-}.tgz")
b2sums=('cc80703428d50d3eb1ba681aedadc3c0136ecbf73505a2982b5be5a34d3dd49e52b70c05af0a30819ede8f5a6edb01d48df58f1b2554c9c17f116258ad45ffad')

build() {
	cd $pkgname-${pkgver/_/-}
	sed -ie 's|log()|log(1.0)|g' configure
	sed -ie "s|trap  *0|trap 'exit 0' 0|g" test/*
	./configure
	make
}

package() {
	cd $pkgname-${pkgver/_/-}
	install -d "$pkgdir"/usr/bin
	install -d "$pkgdir"/usr/share/man/
	make BINDIR="$pkgdir"/usr/bin MANDIR="$pkgdir"/usr/share/man/ install
}
