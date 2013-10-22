# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=pcmanfm-git
pkgver=1.1.2.r36.g9b9dd4c
pkgrel=2
pkgdesc="An extremely fast, lightweight, yet feature-rich file manager with tabbed browsing"
arch=('i686' 'x86_64')
url="http://pcmanfm.sourceforge.net/"
license=('GPL')
depends=('libfm-gtk-git')
makedepends=('git' 'intltool' 'pkg-config')
optdepends=('gvfs: mounting of local and remote drives'
			'gnome-menus: applications menu and "Open with..." dialog')
provides=('pcmanfm')
conflicts=('pcmanfm')
install=pcmanfm.install
source=('git+https://pcmanfm.git.sourceforge.net/gitroot/pcmanfm/pcmanfm')
md5sums=('SKIP')

pkgver() {
	cd pcmanfm
	printf "%s" "$(git describe --always --long | sed 's/-/-r/' | tr - .)"
}

build() {
	cd pcmanfm
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc
	make LDFLAGS="-lm ${LDFLAGS}"
}

package() {
	make -C pcmanfm DESTDIR="$pkgdir" install
}

# vim: set ts=4 sw=4 noet:
