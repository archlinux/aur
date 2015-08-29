# Contributor: Daniel Leidisch <spam@leidisch.net>
# Updated by: Jens Staal <staal1978@gmail.com>
# $Id: PKGBUILD,v 1.12 2010/12/17 21:45:33 andres Exp $

pkgname="heirloom-sh"
pkgver=050706
pkgrel=3
pkgdesc="Traditional sh derived from OpenSolaris code"
arch=('i686' 'x86_64')
url="http://heirloom.sourceforge.net/sh.html"
license=('BSD' 'CDDL')
source=("http://sourceforge.net/projects/heirloom/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
	'000-config.diff')
sha256sums=('25fb8409e1eb75bb5da21ca32baf2d5eebcb8b84a1288d66e65763a125809e1d'
            'f0452b9fb1c58a6f0fba6d49bcd7598f875c94f64ddd8b60bb8ab12bbbaf7c9b')

build() {
	cd "$pkgname-$pkgver"
	
	patch -p1 < ../000-config.diff

	make
}

package() {
	cd "$pkgname-$pkgver"

	make install ROOT="$pkgdir"

	install -Dm644 CALDERA.LICENSE \
		"$pkgdir"/usr/share/licenses/"$pkgname"/CALDERA
}
