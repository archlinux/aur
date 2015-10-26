# Maintainer: Carlos Silva <r3pek@r3pek.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Josh Klar <j@iv597.com>

pkgname=budgie-desktop
pkgver=8.3
pkgrel=1
pkgdesc="Simple GTK3 desktop experience from Solus Project"
arch=('i686' 'x86_64')
url="http://solus-project.com/"
license=('GPL2')

depends=('libwnck3' 'gnome-menus' 'gnome-settings-daemon' 'libpeas'
		 'mutter>=3.14' 'desktop-file-utils' 'libgee' 'gnome-themes-standard'
		 'gtk3>=3.14' 'libpulse' 'upower' 'intltool')

makedepends=('git' 'python2' 'vala' 'gobject-introspection')

install=budgie-desktop.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/solus-project/budgie-desktop/archive/v${pkgver}.tar.gz"
        'git+https://git.gnome.org/browse/libgnome-volume-control#commit=e14dbe8')
sha256sums=('b9415699c57804b008d39f7128c29e392bc659bb2d64fbbd30e359b2bfb74925'
            'SKIP')

prepare() {
	cd "$srcdir"/$pkgname-$pkgver
	rm -r gvc
	mv ../libgnome-volume-control gvc
}

build() {
	cd "$srcdir"/$pkgname-$pkgver
	intltoolize --force
	autoreconf --force --install
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir"/$pkgname-$pkgver
	make -k check
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
