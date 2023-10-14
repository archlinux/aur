# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.2.5
pkgrel=2
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
b2sums=('30407e6457ae52bf0dc3e5f46947d47216535e2c49a66428735953bb5e8c628ec250e31b9a74b29d5d71b724feaa659b077695471822f037143cd3fb36895055')

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
