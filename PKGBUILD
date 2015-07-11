# Maintainer: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>

pkgname=budgie-desktop-git
pkgver=v8.2.r17.ga92612e
pkgrel=1
pkgdesc="Simple GTK3 desktop experience"
arch=('i686' 'x86_64')
url="https://solus-project.com/budgie"
license=('GPLv2')
depends=('gtk3' 'upower' 'libwnck3' 'gnome-menus' 'gnome-settings-daemon' 'libpeas' 'mutter' 'desktop-file-utils' 'libpulse' 'vala' 'libgee' 'gnome-themes-standard' 'gnome-control-center')
makedepends=('autoconf' 'git' 'python2' 'gobject-introspection' 'intltool')
provides=('budgie-desktop')
conflicts=('budgie-desktop')
install=budgie-desktop.install
source=("$pkgname"::'git+https://github.com/solus-project/budgie-desktop.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname"
	make -k check
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
