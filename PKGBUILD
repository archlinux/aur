# Maintainer: Fernando Fernández <fernando at softwareperonista dot com dot ar>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Balló György
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>
pkgname=gxml
pkgver=0.20.2
pkgrel=1
pkgdesc="GObject-based XML parser and writer library"
arch=('x86_64')
url="https://wiki.gnome.org/GXml"
license=('LGPL')
depends=('glib2' 'libgee' 'libxml2')
makedepends=('gobject-introspection' 'meson' 'vala')
source=("https://gitlab.gnome.org/GNOME/${pkgname}/-/archive/${pkgver}/gxml-${pkgver}.tar.gz")
sha256sums=('8310c44590148c304c4622a94e8f6010539e0aea1f7f64af401114f6b957b6f5')

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
