# Maintainer: Joel Teichroeb <joel@teichroeb.net>
# Contributor: atie H. <atie.at.matrix@gmail.com>
# Contributor: alesko <askondro@gmail.com>

pkgname=clutter-git
pkgver=1.24.2.r17.g8c86357
pkgrel=1
pkgdesc='A GObject based library for creating fast, visually rich graphical user interfaces'
arch=('i686' 'x86_64')
url='http://clutter-project.org/'
license=('LGPL')
depends=('cogl' 'mesa' 'json-glib' 'atk' 'libxi' 'gtk-doc' 'libinput' 'gobject-introspection' 'libxkbcommon')
makedepends=('git')
provides=("clutter=${pkgver}")
conflicts=('clutter')
source=('git://git.gnome.org/clutter')
md5sums=('SKIP')

pkgver() {
	cd clutter
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd clutter

	./autogen.sh --prefix=/usr	--enable-introspection \
		--enable-wayland-backend --enable-egl-backend --enable-evdev-input \
		--enable-wayland-compositor
	make 
}

package() {
	cd clutter
	make DESTDIR=$pkgdir install 
}
