# Maintainer: 100best <jm dot 100best at gmail dot com>

pkgname=libhttpseverywhere
pkgrel=1
pkgver=0.2.10
pkgdesc="library to use HTTPSEverywhere in desktop applications"
arch=('i686' 'x86_64')
url="https://git.gnome.org/browse/libhttpseverywhere"
license=('LGPL3')
depends=('libgee' 'libxml2' 'libarchive' 'libsoup' 'glib2' 'json-glib')
makedepends=('meson' 'ninja' 'vala' 'valadoc' 'gobject-introspection')
_commit=53ac5f7eaefb6d8a236e2f29f6127c59a713a17d
source=("git+https://git.gnome.org/browse/libhttpseverywhere#commit=$_commit")
md5sums=('SKIP')


pkgver() {
	cd $srcdir/$pkgname
	git describe --tags | sed 's/-/+/g'
}

prepare() {
	cd "$srcdir/$pkgname"
        mkdir -p "$srcdir/$pkgname/build"
        cd "$srcdir/$pkgname/build"
	meson --prefix "/usr" --libdir "lib"
}
build() {
	cd "$srcdir/$pkgname/build"
	ninja
}

package() {
	cd "$srcdir/$pkgname/build"
	DESTDIR="$pkgdir" ninja install
}
