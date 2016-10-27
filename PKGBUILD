# Maintainer: 100best <jm.100best@hotmail.com>

pkgname=libhttpseverywhere
pkgrel=1
pkgver=0.2.3
pkgdesc="library to use HTTPSEverywhere in desktop applications"
arch=('i686' 'x86_64')
url="https://github.com/grindhold/libhttpseverywhere/"
license=('LGPL3')
depends=('libgee' 'libxml2' 'libarchive' 'libsoup' 'glib2' 'json-glib')
makedepends=('git' 'meson' 'ninja' 'vala' 'valadoc' 'gobject-introspection')
source=(https://github.com/grindhold/libhttpseverywhere/archive/$pkgver.tar.gz)
md5sums=('b7894aae892ae74a6c548710bba25a81')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
        mkdir -p "$srcdir/$pkgname-$pkgver/build"
        cd "$srcdir/$pkgname-$pkgver/build"
	meson --prefix "/usr" --libdir "lib" ..
}
build() {
	cd "$srcdir/$pkgname-$pkgver/build"
	ninja
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	DESTDIR="$pkgdir/" ninja install
}
