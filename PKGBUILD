# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Matt Arsenault <arsenm2@rpi.edu>

pkgname=gitg-git
pkgver=3.17.1.r115.g84eee97
pkgrel=1
pkgdesc='A GIT repository viewer based on GTK+ - git checkout'
arch=('i686' 'x86_64')
url='https://git.gnome.org/browse/gitg/'
license=('GPL')
depends=('gtksourceview3' 'git' 'desktop-file-utils' 'libgit2-glib' 'libgee' 'webkit2gtk' 'libpeas' 'gtkspell3')
makedepends=('intltool' 'vala' 'gobject-introspection' 'gnome-common')
provides=('gitg')
conflicts=('gitg')
install=gitg-git.install
source=('git://git.gnome.org/gitg'
	'git://git.gnome.org/libgd')
sha256sums=('SKIP'
	'SKIP')

pkgver() {
	cd gitg/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd gitg/

	./autogen.sh --prefix=/usr --disable-debug

	make
}

package() {
	cd gitg/

	make DESTDIR="${pkgdir}" install
}

