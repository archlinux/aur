# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.2.4
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
b2sums=('83dae99cee49acc8ac5b75f5c0f3ae4e700a8086e959cd41ff196205c82d38a9e199608d8c3ba6f7acdc03082137526c0d610dd3d047ac249c7f02c3e958b215')

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
