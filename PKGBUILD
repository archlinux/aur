# Maintainer: rern <rernrern@gmail.com>

pkgname=python-upnpp
pkgver=0.26.1
pkgrel=1
pkgdesc="Python UPnP control interface based on libupnpp."
url="https://www.lesbonscomptes.com/upmpdcli/libupnpp-python/upnpp-python.html"
license=(LGPL2.1)
arch=(x86_64)
makedepends=(libnpupnp python-devtools swig)
sourcename=libupnpp-bindings-libupnpp-bindings-v$pkgver
source=(https://framagit.org/medoc92/libupnpp-bindings/-/archive/libupnpp-bindings-v$pkgver/$sourcename.tar.gz)
sha256sums=('4b7a801f2422848a0a902377abddf12ab605d45c9d92375d371d7f8d81e5c7bb')

build() {
	ln -sf $srcdir/{$sourcename,$pkgname}
	cd $srcdir/$pkgname
	mkdir -p build
	arch-meson build
	meson compile -C build
}
package() {
	cd $srcdir/$pkgname
	meson install -C build --destdir $pkgdir
}
