# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.2.10
pkgrel=1
pkgdesc="Simple note taking"
arch=('any')
url="https://gitlab.gnome.org/cheywood/iotas"
license=('GPL3')
depends=('libadwaita' 'python')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('f422d99c82e9a891b878269d1dcb2947a4e3714c0928cb79032b723875cefaf0803115fe4ae427a4b319ff7455613128f801e7996da9d87c38b5abaf22d4ce26')

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
		'org.freedesktop.secrets'
		'gtksourceview5')
	
	meson install -C 'build' --destdir "$pkgdir"
	install -Dm644 "$_srcdir/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
