# Maintainer: Fernando Fernández <fernando at softwareperonista dot com dot ar>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Balló György
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>
pkgname=gxml
pkgver=0.20.1
pkgrel=1
pkgdesc="GObject-based XML parser and writer library"
arch=('x86_64')
url="https://wiki.gnome.org/GXml"
license=('LGPL')
depends=('glib2' 'libgee' 'libxml2')
makedepends=('gobject-introspection' 'meson' 'vala')
source=("https://gitlab.gnome.org/GNOME/${pkgname}/-/archive/${pkgver}/gxml-${pkgver}.tar.gz")
sha256sums=('a047e71b19a5eb159b8ffb4e0a944abf7a07544ad30a42eda9c71b410c3a8a19')

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
