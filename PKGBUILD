# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.1.8
pkgrel=1
pkgdesc="Simple note taking"
arch=('any')
url="https://gitlab.gnome.org/cheywood/iotas"
license=('GPL3')
depends=('libadwaita' 'sqlite' 'org.freedesktop.secrets' 'gtksourceview5'
  'python-requests' 'python-markdown-it-py' 'python-linkify-it-py' 'python-mdit_py_plugins' 'python-gtkspellcheck')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('bd2d269e5f58ab966a870f8e05f893d5c4264128373c126797ff7830cf45fae534c0e8582bc951de9afa687496df36678478f2e923ada906275586f03d77772a')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
