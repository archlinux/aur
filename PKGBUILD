# Maintainer: Ivan Janković <ivan.jankovic.unix@gmail.com>

pkgname=tmuzika
pkgver=1.1.1
pkgrel=1
pkgdesc="Terminal music player with ncurses UI and GStreamer backend"
arch=('x86_64')
url="https://github.com/ivanjeka/tmuzika.git"
license=('GPL-3.0-or-later')
depends=('gstreamer' 'glib2' 'ncurses')
makedepends=('git' 'pkgconf')
provides=('tmuzika')
conflicts=('tmuzika')
source=("tmuzika-$pkgver.tar.gz::https://github.com/ivanjeka/tmuzika/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# binarni fajl
	make DESTDIR="$pkgdir" install

	# desktop fajl
	install -Dm644 desktop/tmuzika.desktop \
		"$pkgdir/usr/share/applications/tmuzika.desktop"

	# dokumentacija
	install -Dm644 docs/README.md \
		"$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 docs/README.sr-cy.md \
		"$pkgdir/usr/share/doc/$pkgname/README.sr-cy.md"
	install -Dm644 docs/README.sr.md \
		"$pkgdir/usr/share/doc/$pkgname/README.sr.md"
	install -Dm644 docs/INSTALL.md \
		"$pkgdir/usr/share/doc/$pkgname/INSTALL.md"

	# license
	install -Dm644 docs/LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# man page
	install -Dm644 man/tmuzika.1 \
		"$pkgdir/usr/share/man/man1/tmuzika.1"
	# man page cirilica
	install -Dm644 man/tmuzika.sr.1 \
		"$pkgdir/usr/share/man/sr/man1/tmuzika.1"
	# man page latinica
	install -Dm644 man/tmuzika.sr_Latn.1 \
		"$pkgdir/usr/share/man/sr@latin/man1/tmuzika.1"
}