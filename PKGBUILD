# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.1.7
pkgrel=1
pkgdesc="Simple note taking"
arch=('any')
url="https://gitlab.gnome.org/cheywood/iotas"
license=('GPL3')
depends=('libadwaita' 'sqlite' 'org.freedesktop.secrets' 'gtksourceview5' 'python-requests' 'python-gtkspellcheck')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('de0edaa1d75f4486ed7634a585a90b3774bffff67f14b519fda1dafc677f620bb1b14b9290ae50bae91deed5adba9cb750a65f5d6e69861a477db32f1a8df176')

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
