# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libgit2-glib-git
pkgver=0.0.6.r17.gcc9d2e9
pkgrel=1
pkgdesc='GLib wrapper for libgit2 - git checkout'
arch=('i686' 'x86_64')
url='http://live.gnome.org/Libgit2-glib'
license=('LGPL2.1')
depends=('glib2' 'libgit2' 'gobject-introspection')
makedepends=('git' 'gnome-common' 'gtk-doc')
provides=('libgit2-glib')
conflicts=('libgit2-glib')
source=('git://git.gnome.org/libgit2-glib')
sha256sums=('SKIP')

pkgver() {
	cd libgit2-glib/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd libgit2-glib/

	./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static
	make
}

check() {
	cd libgit2-glib/

	make check
}

package() {
	cd libgit2-glib/

	make DESTDIR="${pkgdir}" install
}

