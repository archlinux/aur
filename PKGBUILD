# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Balló György
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>
pkgname=gxml
pkgver=0.18.2
pkgrel=2
pkgdesc="GObject-based XML parser and writer library"
arch=('x86_64')
url="https://wiki.gnome.org/GXml"
license=('LGPL')
depends=('glib2' 'libgee' 'libxml2')
provides=('libgxml-0.18.so=2.0.2-64')
makedepends=('gobject-introspection' 'meson' 'vala')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('fbe078b9a56dee1719ef266c6cc6f0c4191371294572c4d67304c828012fe19d')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
