# Maintainer: Carlos Silva <r3pek@r3pek.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Josh Klar <j@iv597.com>

pkgname=budgie-desktop
pkgver=10
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
        'git+https://git.gnome.org/browse/libgnome-volume-control#commit=7e5504d')
sha256sums=('082dd6ed92832aa4993511fe7c2a22bd9c686c40bdc938307f6c8c1aca859f6b'
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
