# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.2.2
pkgrel=1
pkgdesc="Simple note taking"
arch=('any')
url="https://gitlab.gnome.org/cheywood/iotas"
license=('GPL3')
depends=('libadwaita' 'sqlite' 'org.freedesktop.secrets' 'gtksourceview5'
  'python-requests' 'python-markdown-it-py' 'python-linkify-it-py' 'python-mdit_py_plugins' 'python-gtkspellcheck')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('36a758755488f979854b5c237847d08b08371051f6a854980d0838b19c7776a7324a47439d1bda8813d7206e69ce67a9b866ae85b107c4f73d4d6907833a6009')

build() {
  arch-meson "$pkgname-$pkgver" 'build'
  meson compile -C 'build'
}

check() {
  meson test -C 'build' --print-errorlogs || :
}

package() {
  meson install -C 'build' --destdir "$pkgdir"
}
