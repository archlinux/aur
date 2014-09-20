pkgname=pcmanfm-git
pkgver=1.2.1.r3.g8a2c79c
pkgrel=1

pkgdesc="An extremely fast, lightweight, yet feature-rich file manager with tabbed browsing"
url="http://pcmanfm.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')

depends=('libfm-gtk-git')
makedepends=('git' 'intltool' 'pkg-config')
optdepends=('gvfs: mounting of local and remote drives'
            'lxmenu-data: applications menu and "Open with" dialog'
            'gnome-menus: applications menu and "Open with" dialog')

provides=('pcmanfm')
conflicts=('pcmanfm')

install=pcmanfm.install
source=('git://git.lxde.org/git/lxde/pcmanfm'
        pcmanfm.install)

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
