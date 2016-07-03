# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=gbsplay
pkgver=0.0.93.97
pkgrel=1
pkgdesc="A command line application for playing GameBoy sound files (GBS)"
arch=('i686' 'x86_64')
url='https://github.com/mmitch/gbsplay'
license=('GPL')
depends=('libpulse' 'nas')
makedepends=('git')
source=('git+https://github.com/mmitch/gbsplay.git#commit=33c5d7197792a9f869b8c44f374a8b1f2afc5c50')
sha512sums=('SKIP')

prepare() {
	cd gbsplay
	sed 's|gbs2ogg.sh|$0|g' --in-place contrib/gbs2ogg.sh
}

build() {
	cd gbsplay

	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd gbsplay

	make DESTDIR="$pkgdir" install

	cd contrib
	install gbs2ogg.sh "$pkgdir"/usr/bin/gbs2ogg
	install -Dm644 gbsplay.bashcompletion "$pkgdir"/etc/bash_completion.d/gbsplay
}
