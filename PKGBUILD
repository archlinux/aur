# Maintainer: Tom Richards <tom@tomrichards.net>
# Contributor: TingPing <tingping@tingping.se>

_gitname=gnome-games
pkgname=gnome-games-git
pkgver=3.21.2.r1.g0da3e43
pkgrel=1
pkgdesc='A game manager application for GNOME'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://wiki.gnome.org/Apps/Games'
install='gnome-games.install'
# Arch has a group named gnome-games.. rather unfortunate naming
#provides=('gnome-games')
#conflicts=('gnome-games')
depends=('retro-gtk' 'libarchive' 'libtracker-sparql')
makedepends=('git' 'intltool' 'automake' 'autoconf' 'vala')
source=('git+https://git.gnome.org/browse/gnome-games/')
sha256sums=('SKIP')

pkgver() {
	cd "$_gitname"

	git describe --tags --long | sed 's/-/.r/; s/-/./'
}

build() {
	cd "$_gitname"

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$_gitname"

	DESTDIR="$pkgdir" make install
}
