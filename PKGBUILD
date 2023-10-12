# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.2.5
pkgrel=1
pkgdesc="Simple note taking"
arch=('any')
url="https://gitlab.gnome.org/cheywood/iotas"
license=('GPL3')
depends=(
	'libadwaita' 'sqlite' 'org.freedesktop.secrets' 'gtksourceview5'
	'python-requests' 'python-markdown-it-py' 'python-linkify-it-py' 'python-mdit_py_plugins'
	'python-gtkspellcheck')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('2868a08e17701c4e9bd489071da9e7e86308205e3a36d5ff34e320e18e48eace7041e8a65bba6c09f2032dfdd575012a15087ae31fbee2182afb39c24b604fd6')

_srcdir="$pkgname-$pkgver"

build() {
	arch-meson "$_srcdir" 'build'
	meson compile -C 'build'
}

check() {
	meson test -C 'build' --print-errorlogs || :
}

package() {
	meson install -C 'build' --destdir "$pkgdir"
	install -Dm644 "$_srcdir/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
