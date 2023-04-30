# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.1.14
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
b2sums=('e12f50e52740670776232347aa865d61a0d8d6a174f607ac4772dc08bfc1cd945b77b7cb1c0a0b890c8b6b7af90425e711572c467fe1620b646fea08b8bc4150')

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
