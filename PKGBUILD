# Maintainer: Carlos Silva <r3pek@r3pek.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Josh Klar <j@iv597.com>
# Contributor: Stefano <capitani74@gmail.com>

pkgname=budgie-desktop
pkgver=10.2.4
pkgrel=1
pkgdesc="Simple GTK3 desktop experience from Solus Project"
arch=('i686' 'x86_64')
url="http://solus-project.com/"
license=('GPL2')

depends=('libwnck3>=3.14' 'gnome-menus>=3.10.1' 'gnome-settings-daemon' 'libpeas>=1.3.0'
		 'mutter>=3.18' 'desktop-file-utils' 'libgee' 'gnome-themes-standard'
		 'gtk3>=3.16' 'libpulse' 'upower' 'intltool' 'gnome-session>=3.18'
		 'gnome-terminal' 'gnome-control-center' 'nautilus' 'libpulse>=2'
		 'gnome-desktop>=3.18' 'upower>=0.9.20' 'polkit>=0.105' 'gtk-doc')

makedepends=('git' 'python2' 'vala' 'gobject-introspection>=1.44.0')

install=budgie-desktop.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/solus-project/budgie-desktop/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('2556a75220dfde4fd75e80a43a2d07575cea887ad0d4e169acb48e135707beac')

build() {
	cd "$srcdir"/$pkgname-$pkgver
	intltoolize --force
	gtkdocize || exit 1
	autoreconf --force --install
	./configure --prefix=/usr --sysconfdir=/etc
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
