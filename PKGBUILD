# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

pkgname=mx-git
pkgver=1.99.4.r272.g63da1f2
pkgrel=1
pkgdesc="A Clutter-based toolkit"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org"
license=('LGPL')
depends=('clutter' 'gdk-pixbuf2')
makedepends=('git' 'gobject-introspection' 'gtk-doc' 'intltool' 'libtool' 'vala')
provides=('mx')
conflicts=('mx')
source=("$pkgname::git+https://github.com/clutter-project/mx.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	./autogen.sh --prefix=/usr --enable-gtk-doc
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
