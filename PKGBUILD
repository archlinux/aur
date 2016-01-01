# Maintainer: Carlos Silva <r3pek@r3pek.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Josh Klar <j@iv597.com>

pkgname=budgie-desktop
pkgver=10.2.1
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/solus-project/budgie-desktop/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('693210996d5286f4d623900b3bdf6e1882ad237c18cffba95a4d0dce68960b81')

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
