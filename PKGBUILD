# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=gbsplay
pkgver=0.0.92
pkgrel=1
pkgdesc="A command line application for playing GameBoy sound files (GBS)"
arch=('i686' 'x86_64')
url='https://github.com/mmitch/gbsplay'
license=('GPL')
depends=('libpulse' 'nas')
source=("https://github.com/mmitch/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('60e74ed14d871be67bf4edaf2a2bbacc2cf68c07352ae8215cd234d2e6560541c006b645f737491a154884d6d30c701680b2c94ffa43e23afeeb379ebd722638')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr --mandir=/usr/share/man

	sed 's|gbs2ogg.sh|$0|g' --in-place contrib/gbs2ogg.sh

	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	cd contrib
	install gbs2ogg.sh "$pkgdir"/usr/bin/gbs2ogg
	install -Dm644 gbsplay.bashcompletion "$pkgdir"/etc/bash_completion.d/gbsplay
}
