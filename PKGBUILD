# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.2.6
pkgrel=2
pkgdesc="Simple note taking"
arch=('any')
url="https://gitlab.gnome.org/cheywood/iotas"
license=('GPL3')
depends=(
	'libadwaita' 'sqlite' 'org.freedesktop.secrets' 'gtksourceview5'
	'python-requests' 'python-markdown-it-py' 'python-linkify-it-py' 'python-mdit_py_plugins'
	'python-gtkspellcheck' 'hspell' 'nuspell' 'libvoikko')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('2b0b9e32b9083e3feba32d7c1312592d3b4535e24247bfe19adf34d6fcd0acb5fb55ae58715cacde45eb92ba748b63d011ad270c0b6c3632b9153cd99b75b92b')

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
