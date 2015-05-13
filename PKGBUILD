# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: György Balló <ballogy@freestart.hu>

_pkgname=gtk-sharp
pkgname=$_pkgname-git
pkgver=2.99.2.r72.g08f4ae2
pkgrel=1
pkgdesc="C# bindings to the cross platform Gtk+ GUI toolkit (git-master)"
arch=('i686' 'x86_64')
url="http://www.mono-project.com/docs/gui/gtksharp/"
license=('LGPL')
depends=('mono' 'gtk3')
makedepends=('git')
source=('git://github.com/mono/gtk-sharp.git#branch=master')
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"

	./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--disable-static
	make
}

package() {
	cd "$srcdir/$_pkgname"

	make DESTDIR="$pkgdir/" install
	rm -r "$pkgdir"/usr/lib/monodoc
}
