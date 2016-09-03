# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis-git
pkgver=0.7.2.r80.g783a296
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL2')
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb')
makedepends=('meson' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=('git+https://github.com/AravisProject/aravis')
sha256sums=('SKIP')

_srcname=aravis

pkgver() {
	cd "$srcdir/$_srcname"
	git describe --always  | sed -e 's/ARAVIS_//' -e 's/_/./g' -e 's/-/.r/' -e 's/-/./'
}

build() {
	arch-meson $_srcname build
	ninja -C build
}

check() {
	ninja test -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
