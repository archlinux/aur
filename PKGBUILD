# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgbase=libfm
pkgname=$_pkgbase-git
pkgver=1.3.2
pkgrel=1
pkgdesc="A glib/gio-based library to develop file managers. Does not include the GTK components."
arch=("i686" "x86_64")
url="http://www.lxde.org"
license=("GPL2")
depends=("menu-cache")
optdepends=("libexif")
makedepends=("git" "libexif" "vala" "gtk-doc" "intltool")
provides=("$_pkgbase" "$_pkgbase-extra")
conflicts=("$_pkgbase" "$_pkgbase-extra")
source=("git+https://github.com/lxde/$_pkgbase.git")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/$_pkgbase"
	git describe --always | sed "s/-/./g"
}

build() {
	cd "$srcdir/$_pkgbase"
	./autogen.sh
	./configure \
		--without-gtk \
		--disable-gtk-doc \
		--disable-udisks \
		--enable-actions \
		--prefix="/usr" \
		--sysconfdir="/etc"
	make
}

package() {
	cd "$srcdir/$_pkgbase"
	make DESTDIR="$pkgdir" install
}
