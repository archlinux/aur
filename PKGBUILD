# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mawk

pkgver=1.3.4_20260302
pkgrel=1

pkgdesc="An interpreter for the AWK Programming Language"
arch=('i686' 'x86_64')
url="http://invisible-island.net/mawk/"
license=('GPL')

depends=('glibc')
changelog="changelog.txt"

source=("https://invisible-island.net/archives/$pkgname/$pkgname-${pkgver//_/-}.tgz")
b2sums=('17547d29e90035f8d916f2d126961ee2d0b17150c3934d3bbb14bbf3ee483bdfa1b50de1b33d157392a88dbb507545733d2bf42172b0986eef4199ca47f086e8')

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
