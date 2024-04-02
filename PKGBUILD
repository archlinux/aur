# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.2.12
pkgrel=1
pkgdesc="Simple note taking"
arch=('any')
url="https://gitlab.gnome.org/cheywood/iotas"
license=('GPL3')
depends=('libadwaita' 'python' 'gtksourceview5')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('6b4d17b5207644532c813993213da0fd927d7683740e24a927e25a4152e7dc2ac3c13c032461a6644272e4011037d1a6be41f2b6d01d5d45458bacf34800747f')

_srcdir="$pkgname-$pkgver"

build() {
	arch-meson "$_srcdir" 'build'
	meson compile -C 'build'
}

check() {
	meson test -C 'build' --print-errorlogs || :
}

package() {
	depends+=(
		'webkitgtk-6.0'
		'python-requests'
		'python-markdown-it-py'
		'python-linkify-it-py'
		'python-mdit_py_plugins'
		'python-gtkspellcheck'
		'hspell'
		'nuspell'
		'libvoikko'
		'sqlite'
		'org.freedesktop.secrets')
	
	meson install -C 'build' --destdir "$pkgdir"
	install -Dm644 "$_srcdir/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
