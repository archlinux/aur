# Maintainer:  Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=jpilot
pkgver=2.0.3
pkgrel=1
pkgGitHubCommit=0275723
pkgdesc="A desktop organizer application for the Palm Pilot"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/juddmon/jpilot/"
license=('GPL2')
depends=('openssl' 'gtk3' 'pilot-link' 'slang')
makedepends=('intltool')
source=("https://codeload.github.com/juddmon/jpilot/legacy.tar.gz/$pkgGitHubCommit")
sha256sums=('0f0a661d09683cb2e21644e73029d81b9194b8af4de9eeec3e39c9b5c06395b2')

build() {
	cd "${srcdir}"/juddmon-$pkgname-$pkgGitHubCommit

	./autogen.sh --prefix=/usr --disable-pl-test --disable-gtktest
	sed 's/return Contact_add_blob(c, blob);/return Contact_add_blob(c, (void*)blob);/' jp-contact.c > /tmp/jp-contact.c
	mv /tmp/jp-contact.c .
	make
}

package() {
	cd "${srcdir}"/juddmon-$pkgname-$pkgGitHubCommit

	make DESTDIR="${pkgdir}" install

	install -d "${pkgdir}"/usr/share/pixmaps
	cd "${pkgdir}"/usr/share/pixmaps
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon1.xpm jpilot-icon1.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon2.xpm jpilot-icon2.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon3.xpm jpilot-icon3.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon4.xpm jpilot-icon4.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon1.xpm jpilot.xpm
}

