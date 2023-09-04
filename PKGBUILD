# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.2.3
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
b2sums=('d26e19fa59da62cdf4f89e5a84df5b6a5470e58c26d94a0991f56c343e274c37ebf881ca269011658f16ba634d2c0e04e7c37812214e9a4e889fe46eb39780d5')

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
