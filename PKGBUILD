# Maintainer: Ralph Holmes <ybden@ybden.com>
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=mandoc
pkgver=1.13.4
pkgrel=1
pkgdesc='A suite of tools compiling mdoc from the OpenBSD project'
arch=('i686' 'x86_64')
url='http://mdocml.bsd.lv/'
license=('custom: ISC')
depends=('sqlite')
source=("http://mdocml.bsd.lv/snapshots/mdocml-$pkgver.tar.gz"
        'configure.local')
sha256sums=('0a55c1addb188071d6f784599303656b8465e98ec6b2f4f264e12fb96d79e0ef'
            '3821922c5cbafb93f48f8224befbd61c48f7742f46ef608b652cb545c46f8f87')

prepare() {
	cp "$srcdir"/configure.local mdocml-$pkgver
}

build() {
	cd mdocml-$pkgver
	./configure
	make
}

package() {
	cd mdocml-$pkgver
	make -j1 install DESTDIR="$pkgdir"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
