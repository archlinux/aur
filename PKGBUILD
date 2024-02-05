# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.2.7
pkgrel=2
pkgdesc="Simple note taking"
arch=('any')
url="https://gitlab.gnome.org/cheywood/iotas"
license=('GPL3')
depends=('libadwaita' 'python')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('4967d2125868f104f28da6e38548852669fe5638dcd2625f054a4df3d27b008ebd413d16c6c3e5796c039990297ccd1653ea88b9c273a208bf56b7c08fe2242b')

_srcdir="$pkgname-$pkgver"

build() {
	arch-meson "$_srcdir" 'build'
	meson compile -C 'build'
}

check() {
	meson test -C 'build' --print-errorlogs || :
}

package() {
	depends=(
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
		'org.freedesktop.secrets'
		'gtksourceview5')
	
	meson install -C 'build' --destdir "$pkgdir"
	install -Dm644 "$_srcdir/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
