# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=pcmanfm-git
pkgver=git
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
source=('git://git.lxde.org/git/lxde/pcmanfm' 'pcmanfm.install')
md5sums=('SKIP'
         'fc9ea2af71f55f32c8b22bf5ea879e69')

pkgver() {
	cd pcmanfm
	git describe --always --long | sed 's/-/-r/; s/-/./g'
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
