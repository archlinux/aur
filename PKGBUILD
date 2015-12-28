# Maintainer: Carlos Silva <r3pek@r3pek.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Josh Klar <j@iv597.com>

pkgname=budgie-desktop
pkgver=10.1
pkgrel=2
pkgdesc="Simple GTK3 desktop experience from Solus Project"
arch=('i686' 'x86_64')
url="http://solus-project.com/"
license=('GPL2')

depends=('libwnck3' 'gnome-menus' 'gnome-settings-daemon' 'libpeas'
		 'mutter>=3.18' 'desktop-file-utils' 'libgee' 'gnome-themes-standard'
		 'gtk3>=3.18' 'libpulse' 'upower' 'intltool' 'gnome-session>=3.18'
		 'gnome-terminal' 'gnome-control-center' 'nautilus')

makedepends=('git' 'python2' 'vala' 'gobject-introspection')

install=budgie-desktop.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/solus-project/budgie-desktop/archive/v${pkgver}.tar.gz"
        'git+https://git.gnome.org/browse/libgnome-volume-control#commit=7e5504d')
sha256sums=('27cfae3c253c5546d5cf31a63cc519cd60c94466be5a2d6f8130f412013b61c4'
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
