# Maintainer: TingPing <tingping@tingping.se>

_gitname=libsexy3
pkgname=libsexy3-git
pkgver=v1.0.0.r14.g7c5eab2
pkgrel=1
pkgdesc='Custom Gtk3 widgets'
arch=('i686' 'x86_64')
license=('GPL')
url='https://tingping.github.io/libsexy3'
depends=('gtk3' 'enchant')
makedepends=('iso-codes' 'autoconf' 'automake' 'libtool' 'pkgconfig'
			'autoconf-archive' 'gtk-doc' 'gobject-introspection' 'vala')
source=('git+https://github.com/TingPing/libsexy3.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"
	./autogen.sh --prefix=/usr --disable-debug --enable-gtk-doc
	make
}

package() {
	cd "$_gitname"
	DESTDIR="$pkgdir" make install
}
