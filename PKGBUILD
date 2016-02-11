# Maintainer: TingPing <tingping@tingping.se>

_gitname=libsexy3
pkgname=libsexy3-git
pkgver=1.1.0.r0.g2cdd4c6
pkgrel=1
pkgdesc='Custom Gtk3 widgets'
arch=('i686' 'x86_64')
license=('GPL')
url='https://tingping.github.io/libsexy3'
provides=('libsexy3')
conflicts=('libsexy3')
depends=('gtk3' 'enchant')
makedepends=('iso-codes' 'autoconf' 'automake' 'libtool' 'pkgconfig'
			'autoconf-archive' 'gtk-doc' 'gobject-introspection' 'vala')
source=('git+https://github.com/TingPing/libsexy3.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long | sed 's/^v//; s/-/.r/; s/-/./'
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
