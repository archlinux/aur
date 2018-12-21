# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=plgi
pkgver=1.0.6
pkgrel=1
pkgdesc="Prolog bindings for GLib/GObject/GIO/GTK+"
arch=(x86_64)
url="https://github.com/keriharris/plgi"
license=(LGPL2.1)
depends=(gobject-introspection-runtime swi-prolog)
makedepends=(gobject-introspection)
checkdepends=()
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/keriharris/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d2e2105acadd0d6752e42304d6a7e1d51025b3c82efdc2a30ca84d402860910d')

prepare() {
	cd $pkgname-$pkgver
	autoreconf -fi
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make
}

check() {
	cd $pkgname-$pkgver
	make -k check || :
}

package() {
	cd $pkgname-$pkgver
	install -dm755 "$pkgdir"$(pkg-config --variable=PLBASE swipl)/library
	make DESTDIR="$pkgdir" install
}
