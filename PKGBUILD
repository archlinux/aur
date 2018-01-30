# Maintainer:  Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=jpilot
pkgver=1.8.2
pkgrel=3
pkgdesc="A desktop organizer application for the Palm Pilot"
arch=('i686' 'x86_64')
url="http://www.jpilot.org/"
license=('GPL2')
depends=('openssl' 'gtk2' 'pilot-link')
makedepends=('intltool')
source=(http://jpilot.org/tarballs/$pkgname-$pkgver.tar.gz)
sha256sums=('2c28ed7acea27ae3d541036f2e2ca5ed7e0121badf477e3cfa5ec8d282337e23')

prepare() {
	cd "${srcdir}"/$pkgname-$pkgver
	patch jpilot-merge.c <<-EOF
		290c290
		<    if (argc != 3) {
		---
		>    if (argc != 4) {
	EOF
}

build() {
	cd "${srcdir}"/$pkgname-$pkgver

	./configure --prefix=/usr --disable-pl-test --disable-gtktest
	make
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver

	make DESTDIR="${pkgdir}" install

	install -d "${pkgdir}"/usr/share/pixmaps
	cd "${pkgdir}"/usr/share/pixmaps
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon1.xpm jpilot-icon1.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon2.xpm jpilot-icon2.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon3.xpm jpilot-icon3.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon4.xpm jpilot-icon4.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon1.xpm jpilot.xpm
}

