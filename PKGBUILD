# Contributor: Zephyr
# Contributor: vitamin1980 <vitamin.novgorod @ yandex.ru>
# Contributor: Cezary Drożak <cezary at drozak.net>

pkgname=oxygen-gtk3-git
pkgver=20160429_vgtk3_1.4.1_12_g705b7
pkgrel=1
pkgdesc="Port of the default KDE widget theme (Oxygen) to GTK3"
arch=('i686' 'x86_64')
url="https://invent.kde.org/plasma/oxygen-gtk"
license=('LGPL')
depends=('gtk3' 'dbus-glib')
makedepends=('git' 'cmake')
conflicts=('oxygen-gtk3')
provides=('oxygen-gtk3')
options=('!strip')
source=("git+https://invent.kde.org/plasma/oxygen-gtk.git#branch=gtk3")
md5sums=('SKIP')

_gitname="oxygen-gtk"

pkgver() {
	cd "$srcdir/$_gitname"

	git describe --long | sed 's/vgtk3-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_gitname}"
	mkdir build && cd build

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=debugfull \
		..

	make
}

package() {
	cd "${srcdir}/${_gitname}/build"
	make DESTDIR=${pkgdir} install
}
