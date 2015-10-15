# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=gbsplay
pkgver=0.0.93
pkgrel=1
pkgdesc="A command line application for playing GameBoy sound files (GBS)"
arch=('i686' 'x86_64')
url='https://github.com/mmitch/gbsplay'
license=('GPL')
depends=('libpulse' 'nas')
source=("https://github.com/mmitch/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('25ecd55c8bc46be26ebf790db99a2593ad9fbe348efb738e588c36436aea84d30393b3af4be39d57df1ca7bfe89c66b24f5a146dff2ec7712c0ace74f0bba8e9')

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
